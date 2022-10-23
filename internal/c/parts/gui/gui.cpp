//-----------------------------------------------------------------------------------------------------
//    ___  ____   __   _  _   ____  _____    ____ _   _ ___   _     _ _
//   / _ \| __ ) / /_ | || | |  _ \| ____|  / ___| | | |_ _| | |   (_) |__  _ __ __ _ _ __ _   _
//  | | | |  _ \| '_ \| || |_| |_) |  _|   | |  _| | | || |  | |   | | '_ \| '__/ _` | '__| | | |
//  | |_| | |_) | (_) |__   _|  __/| |___  | |_| | |_| || |  | |___| | |_) | | | (_| | |  | |_| |
//   \__\_\____/ \___/   |_| |_|   |_____|  \____|\___/|___| |_____|_|_.__/|_|  \__,_|_|   \__, |
//                                                                                         |___/
//  QB64-PE GUI Library
//  Powered by tinyfiledialogs (http://tinyfiledialogs.sourceforge.net)
//
//  Copyright (c) 2022 Samuel Gomes
//  https://github.com/a740g
//
//-----------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------
// HEADER FILES
//-----------------------------------------------------------------------------------------------------
#include "gui.h"
// We need the IMAGE_... macros from here
#include "image.h"
#include "tinyfiledialogs.h"
// The below include is a bad idea because of reasons mentioned in https://github.com/QB64-Phoenix-Edition/QB64pe/issues/172
// However, we need a bunch of things like the 'qbs' structs and some more
// We'll likely keep the 'include' this way because I do not want to duplicate stuff and cause issues
// Matt is already doing work to separate and modularize libqb
// So, this will be replaced with relevant stuff once that work is done
#include "../../libqb.h"
//-----------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------
// FUNCTIONS
//-----------------------------------------------------------------------------------------------------
/// @brief Splits a string delimted by '|' into an array of strings
/// @param input The string to be parsed
/// @param count Point to an integer that will hold the count of tokens. This cannot be NULL
/// @return Array of string tokens. This must be freed using gui_free_tokens()
static char **gui_tokenize(const char *input, int32_t *count) {
    auto str = strdup(input); // since strtok() modifys the string
    auto capacity = 2;
    char **result = (char **)malloc(capacity * sizeof(*result));

    (*count) = 0; // Set count to zero
    auto tok = strtok(str, "|");

    for (;;) {
        if ((*count) >= capacity)
            result = (char **)realloc(result, (capacity *= 2) * sizeof(*result));

        result[(*count)++] = tok ? strdup(tok) : tok;

        if (!tok)
            break;

        tok = strtok(nullptr, "|");
    }

    free(str);

    --(*count); // Since incrementing happens before we check for null above

    return result;
}

/// @brief Frees all string and the array itself created by gui_tokenize()
/// @param tokens Array of string pointers
static void gui_free_tokens(char **tokens) {
    for (auto it = tokens; it && *it; ++it)
        free(*it);

    free(tokens);
}

/// @brief Shows a system notification (on Windows this will be an action center notification)
/// @param qbsTitle [OPTIONAL] Title of the notification
/// @param qbsMessage [OPTIONAL] The message that will be displayed
/// @param qbsIconType [OPTIONAL] Icon type ("info" "warning" "error")
/// @param passed How many parameters were passed?
void sub__guiNotifyPopup(qbs *qbsTitle, qbs *qbsMessage, qbs *qbsIconType, int32_t passed) {
    static qbs *aTitle = nullptr;
    static qbs *aMessage = nullptr;
    static qbs *aIconType = nullptr;

    if (!aTitle)
        aTitle = qbs_new(0, 0);

    if (!aMessage)
        aMessage = qbs_new(0, 0);

    if (!aIconType)
        aIconType = qbs_new(0, 0);

    if (passed & 1)
        qbs_set(aTitle, qbs_add(qbsTitle, qbs_new_txt_len("\0", 1)));
    else
        qbs_set(aTitle, qbs_new_txt_len("\0", 1));

    if (passed & 2)
        qbs_set(aMessage, qbs_add(qbsMessage, qbs_new_txt_len("\0", 1)));
    else
        qbs_set(aMessage, qbs_new_txt_len("\0", 1));

    if (passed & 4)
        qbs_set(aIconType, qbs_add(qbsIconType, qbs_new_txt_len("\0", 1)));
    else
        qbs_set(aIconType, qbs_new_txt("info")); // info if not passed

    tinyfd_notifyPopup((const char *)aTitle->chr, (const char *)aMessage->chr, (const char *)aIconType->chr);
}

/// @brief Shows a standard system message dialog box
/// @param qbsTitle Title of the dialog box
/// @param qbsMessage The message that will be displayed
/// @param qbsDialogType The dialog type ("ok" "okcancel" "yesno" "yesnocancel")
/// @param qbsIconType The dialog icon type ("info" "warning" "error" "question")
/// @param nDefaultButon [OPTIONAL] The default button that will be selected
/// @param passed How many parameters were passed?
/// @return 0 for cancel/no, 1 for ok/yes, 2 for no in yesnocancel
int32_t func__guiMessageBox(qbs *qbsTitle, qbs *qbsMessage, qbs *qbsDialogType, qbs *qbsIconType, int32_t nDefaultButton, int32_t passed) {
    static qbs *aTitle = nullptr;
    static qbs *aMessage = nullptr;
    static qbs *aDialogType = nullptr;
    static qbs *aIconType = nullptr;

    if (!aTitle)
        aTitle = qbs_new(0, 0);

    if (!aMessage)
        aMessage = qbs_new(0, 0);

    if (!aDialogType)
        aDialogType = qbs_new(0, 0);

    if (!aIconType)
        aIconType = qbs_new(0, 0);

    qbs_set(aTitle, qbs_add(qbsTitle, qbs_new_txt_len("\0", 1)));
    qbs_set(aMessage, qbs_add(qbsMessage, qbs_new_txt_len("\0", 1)));
    qbs_set(aDialogType, qbs_add(qbsDialogType, qbs_new_txt_len("\0", 1)));
    qbs_set(aIconType, qbs_add(qbsIconType, qbs_new_txt_len("\0", 1)));

    if (!passed)
        nDefaultButton = 1; // 1 for ok/yes

    return tinyfd_messageBox((const char *)aTitle->chr, (const char *)aMessage->chr, (const char *)aDialogType->chr, (const char *)aIconType->chr,
                             nDefaultButton);
}

/// @brief Shows a standard system message dialog box
/// @param qbsTitle [OPTIONAL] Title of the dialog box
/// @param qbsMessage [OPTIONAL] The message that will be displayed
/// @param qbsIconType [OPTIONAL] The dialog icon type ("info" "warning" "error")
/// @param passed How many parameters were passed?
void sub__guiMessageBox(qbs *qbsTitle, qbs *qbsMessage, qbs *qbsIconType, int32_t passed) {
    static qbs *aTitle = nullptr;
    static qbs *aMessage = nullptr;
    static qbs *aIconType = nullptr;

    if (!aTitle)
        aTitle = qbs_new(0, 0);

    if (!aMessage)
        aMessage = qbs_new(0, 0);

    if (!aIconType)
        aIconType = qbs_new(0, 0);

    if (passed & 1)
        qbs_set(aTitle, qbs_add(qbsTitle, qbs_new_txt_len("\0", 1)));
    else
        qbs_set(aTitle, qbs_new_txt_len("\0", 1));

    if (passed & 2)
        qbs_set(aMessage, qbs_add(qbsMessage, qbs_new_txt_len("\0", 1)));
    else
        qbs_set(aMessage, qbs_new_txt_len("\0", 1));

    if (passed & 4)
        qbs_set(aIconType, qbs_add(qbsIconType, qbs_new_txt_len("\0", 1)));
    else
        qbs_set(aIconType, qbs_new_txt("info")); // info if not passed

    tinyfd_messageBox((const char *)aTitle->chr, (const char *)aMessage->chr, "ok", (const char *)aIconType->chr, 1);
}

/// @brief Shows an input box for getting a string from the user
/// @param qbsTitle Title of the dialog box
/// @param qbsMessage The message or prompt that will be displayed
/// @param qbsDefaultInput [OPTIONAL] The default response that can be changed by the user
/// @param passed How many parameters were passed?
/// @return The user response or an empty string if the user cancelled
qbs *func__guiInputBox(qbs *qbsTitle, qbs *qbsMessage, qbs *qbsDefaultInput, int32_t passed) {
    static qbs *aTitle = nullptr;
    static qbs *aMessage = nullptr;
    static qbs *aDefaultInput = nullptr;
    char *sDefaultInput = nullptr;

    if (!aTitle)
        aTitle = qbs_new(0, 0);

    if (!aMessage)
        aMessage = qbs_new(0, 0);

    if (!aDefaultInput)
        aDefaultInput = qbs_new(0, 0);

    qbs_set(aTitle, qbs_add(qbsTitle, qbs_new_txt_len("\0", 1)));
    qbs_set(aMessage, qbs_add(qbsMessage, qbs_new_txt_len("\0", 1)));

    if (passed) {
        qbs_set(aDefaultInput, qbs_add(qbsDefaultInput, qbs_new_txt_len("\0", 1)));
        sDefaultInput =
            aDefaultInput->len == 1 ? nullptr : (char *)aDefaultInput->chr; // if string is "" then password box, else we pass the default input as is
    } else {
        qbs_set(aDefaultInput, qbs_new_txt_len("\0", 1)); // input box by default
        sDefaultInput = (char *)aDefaultInput->chr;
    }

    auto sInput = tinyfd_inputBox((const char *)aTitle->chr, (const char *)aMessage->chr, (const char *)sDefaultInput);

    return qbs_new_txt(sInput);
}

/// @brief Shows the browse for folder dialog box
/// @param qbsTitle Title of the dialog box
/// @param qbsDefaultPath [OPTIONAL] The default path from where to start browsing
/// @param passed How many parameters were passed?
/// @return The path selected by the user or an empty string if the user cancelled
qbs *func__guiSelectFolderDialog(qbs *qbsTitle, qbs *qbsDefaultPath, int32_t passed) {
    static qbs *aTitle = nullptr;
    static qbs *aDefaultPath = nullptr;

    if (!aTitle)
        aTitle = qbs_new(0, 0);

    if (!aDefaultPath)
        aDefaultPath = qbs_new(0, 0);

    qbs_set(aTitle, qbs_add(qbsTitle, qbs_new_txt_len("\0", 1)));

    if (passed)
        qbs_set(aDefaultPath, qbs_add(qbsDefaultPath, qbs_new_txt_len("\0", 1)));
    else
        qbs_set(aDefaultPath, qbs_new_txt_len("\0", 1));

    auto sFolder = tinyfd_selectFolderDialog((const char *)aTitle->chr, (const char *)aDefaultPath->chr);

    return qbs_new_txt(sFolder);
}

/// @brief Shows the color picker dialog box
/// @param qbsTitle Title of the dialog box
/// @param nDefaultRGB [OPTIONAL] Default selected color
/// @param passed How many parameters were passed?
/// @return 0 on cancel (i.e. no color, no alpha, nothing). Else, returns color with alpha set to 255
uint32_t func__guiColorChooserDialog(qbs *qbsTitle, uint32_t nDefaultRGB, int32_t passed) {
    static qbs *aTitle = nullptr;

    if (!aTitle)
        aTitle = qbs_new(0, 0);

    qbs_set(aTitle, qbs_add(qbsTitle, qbs_new_txt_len("\0", 1)));

    if (!passed)
        nDefaultRGB = 0;

    // Break the color into RGB components
    uint8_t lRGB[3] = {IMAGE_GET_BGRA_RED(nDefaultRGB), IMAGE_GET_BGRA_GREEN(nDefaultRGB), IMAGE_GET_BGRA_BLUE(nDefaultRGB)};

    // On cancel, return 0 (i.e. no color, no alpha, nothing). Else, return color with alpha set to 255
    return !tinyfd_colorChooser((const char *)aTitle->chr, nullptr, lRGB, lRGB) ? 0 : IMAGE_MAKE_BGRA(lRGB[0], lRGB[1], lRGB[2], 0xFF);
}

/// @brief Shows the system file open dialog box
/// @param qbsTitle Title of the dialog box
/// @param qbsDefaultPathAndFile The default path (and filename) that will be pre-populated
/// @param qbsFilterPatterns File filters separated using '|' (e.g. "*.png|*.jpg")
/// @param qbsSingleFilterDescription Single filter description (e.g. "Image files")
/// @param nAllowMultipleSelects [OPTIONAL] Should multiple file selection be allowed?
/// @param passed How many parameters were passed?
/// @return The file name (or names separated by '|' if multiselect was on) selected by the user or an empty string if the user cancelled
qbs *func__guiOpenFileDialog(qbs *qbsTitle, qbs *qbsDefaultPathAndFile, qbs *qbsFilterPatterns, qbs *qbsSingleFilterDescription, int32_t nAllowMultipleSelects,
                             int32_t passed) {
    static qbs *aTitle = nullptr;
    static qbs *aDefaultPathAndFile = nullptr;
    static qbs *aFilterPatterns = nullptr;
    static qbs *aSingleFilterDescription = nullptr;

    if (!aTitle)
        aTitle = qbs_new(0, 0);

    if (!aDefaultPathAndFile)
        aDefaultPathAndFile = qbs_new(0, 0);

    if (!aFilterPatterns)
        aFilterPatterns = qbs_new(0, 0);

    if (!aSingleFilterDescription)
        aSingleFilterDescription = qbs_new(0, 0);

    qbs_set(aTitle, qbs_add(qbsTitle, qbs_new_txt_len("\0", 1)));
    qbs_set(aDefaultPathAndFile, qbs_add(qbsDefaultPathAndFile, qbs_new_txt_len("\0", 1)));
    qbs_set(aFilterPatterns, qbs_add(qbsFilterPatterns, qbs_new_txt_len("\0", 1)));
    qbs_set(aSingleFilterDescription, qbs_add(qbsSingleFilterDescription, qbs_new_txt_len("\0", 1)));

    if (!passed)
        nAllowMultipleSelects = false;

    char *sSingleFilterDescription = aSingleFilterDescription->len == 1 ? nullptr : (char *)aSingleFilterDescription->chr;

    int32_t aNumOfFilterPatterns;
    auto psaFilterPatterns = gui_tokenize((const char *)aFilterPatterns->chr, &aNumOfFilterPatterns); // get the number of file filters & count

    auto sFileName = tinyfd_openFileDialog((const char *)aTitle->chr, (const char *)aDefaultPathAndFile->chr, aNumOfFilterPatterns, psaFilterPatterns,
                                           (const char *)sSingleFilterDescription, nAllowMultipleSelects);

    gui_free_tokens(psaFilterPatterns); // free memory used by tokenizer

    return qbs_new_txt(sFileName);
}

/// @brief Shows the system file save dialog box
/// @param qbsTitle Title of the dialog box
/// @param qbsDefaultPathAndFile The default path (and filename) that will be pre-populated
/// @param qbsFilterPatterns File filters separated using '|' (e.g. "*.png|*.jpg")
/// @param qbsSingleFilterDescription Single filter description (e.g. "Image files")
/// @return The file name selected by the user or an empty string if the user cancelled
qbs *func__guiSaveFileDialog(qbs *qbsTitle, qbs *qbsDefaultPathAndFile, qbs *qbsFilterPatterns, qbs *qbsSingleFilterDescription) {
    static qbs *aTitle = nullptr;
    static qbs *aDefaultPathAndFile = nullptr;
    static qbs *aFilterPatterns = nullptr;
    static qbs *aSingleFilterDescription = nullptr;

    if (!aTitle)
        aTitle = qbs_new(0, 0);

    if (!aDefaultPathAndFile)
        aDefaultPathAndFile = qbs_new(0, 0);

    if (!aFilterPatterns)
        aFilterPatterns = qbs_new(0, 0);

    if (!aSingleFilterDescription)
        aSingleFilterDescription = qbs_new(0, 0);

    qbs_set(aTitle, qbs_add(qbsTitle, qbs_new_txt_len("\0", 1)));
    qbs_set(aDefaultPathAndFile, qbs_add(qbsDefaultPathAndFile, qbs_new_txt_len("\0", 1)));
    qbs_set(aFilterPatterns, qbs_add(qbsFilterPatterns, qbs_new_txt_len("\0", 1)));
    qbs_set(aSingleFilterDescription, qbs_add(qbsSingleFilterDescription, qbs_new_txt_len("\0", 1)));

    char *sSingleFilterDescription = aSingleFilterDescription->len == 1 ? nullptr : (char *)aSingleFilterDescription->chr;

    int32_t aNumOfFilterPatterns;
    auto psaFilterPatterns = gui_tokenize((const char *)aFilterPatterns->chr, &aNumOfFilterPatterns); // get the number of file filters & count

    auto sFileName = tinyfd_saveFileDialog((const char *)aTitle->chr, (const char *)aDefaultPathAndFile->chr, aNumOfFilterPatterns, psaFilterPatterns,
                                           (const char *)sSingleFilterDescription);

    gui_free_tokens(psaFilterPatterns); // free memory used by tokenizer

    return qbs_new_txt(sFileName);
}
//-----------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------