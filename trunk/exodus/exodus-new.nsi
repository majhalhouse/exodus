/**
;; -*- tab-width: 4; -*-
;    Copyright 2003, Joe Hildebrand
;
;    This file is part of Exodus.
;
;    Exodus is free software; you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation; either version 2 of the License, or
;    (at your option) any later version.
;
;    Exodus is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with Exodus; if not, write to the Free Software
;    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

; If you are trying to create a branded version of Exodus, search for
; BRANDING in this file.
**/

/*
    2007-11-02 - Modified install script to work with Gooogle code repository.
    2004-03-29 - Added MAP file to daily build installers.
    2004-02-11 - Lazarus Long <lazarus (dot) long (at) bigfoot (dot) com>
                (all changes were made implying the usage of a stock 2.0 version
                of NSIS).
               - removed some defines by inclusion of the corresponding
                 standard Sections.nsh file.
               - replaced the MUI inclusion file with the correponding standard
                 MUI.nsh.
               - removed and added MUI_ defines to reflect the new MUI.
               - rearranged the file contents (I'm sorry for this one but I was
                 getting lost trying to follow the flow).
               - added a series of conditional compiles for switching the
                 registry from HKCU to HKLM (I didn't go all the way and kept
                 backward compatibility because I don't know if the program
                 itself checks for some key in HKCU) to activate uncomment the
                 define USE_HKLM_KEY at the start of the script.
               - added the possibility to use header compression (using UPX).
               - added personal tweaks (can be disabled by removing a !define).
               - moved the localization strings to locale.nsh, changed labels
                 and added functions to support localization.
    2004-02-16 - Lazarus Long <lazarus (dot) long (at) bigfoot (dot) com>
               - realized that ZipDLL isn't part of the stock NSIS 2.0 so I
                 downloaded it from:
                 <http://nsis.sourceforge.net/archive/download.php?file=ZipDLLv1.2.zip>
                 and put ZipDLL.dll and ZipDLL.nsh the parent dir of the one
                 where exodus.nsi lives (the script will fail if it isn't so).
    2004-02-17 - Lazarus Long <lazarus (dot) long (at) bigfoot (dot) com>
               - I'm assuming that the example-plugin-*.* files aren't auto
                 generated by a script (if they are I'm in trouble to put this
                 to work).
               - rearranged the plugins stuff to use "example-plugin-i18n.nsi"
                 and dropped "example-plugin-en.nsi".
               - reluctantly (against my intention to keep the i18n strings all
                 in one file) created the "example-plugin-locale.nsh" in the
                 plugins dir since the plugin stuff is all there.
               - added several functions (didn't keep track of all of them but
                 they all start with "func") and removed one or two (either
                 redundanct or replaced by faster alternatives).
    2004-02-19 - Lazarus Long <lazarus (dot) long (at) bigfoot (dot) com>
               - removed the non default naming convention when the LAZARUS
                 define was set and added version information to the installer
                 (I just realized that it's better this way, especially for ME,
                 2K and XP users who see it in the Explorer).
               - renamed all the scripts that are part of the "new" branch to
                 avoid naming conflict with the current scripts.
               - added the ReserveFile for the "ZipDLL.dll" and "System.dll"
                 plugins.
               - removed the SubCaption command near the end of the script
                 (it was redundant and probably remained there from pre-MUI
                 builds).
    2004-02-24 - Lazarus Long <lazarus (dot) long (at) bigfoot (dot) com>
               - implemented the option to remove the user logs when
                 uninstalling (this implied creating a new "un-notify.ini"
                 options file).
               - fixed the warnings about the MSG_NoAdmin string not defined
                 in functions funcCheckAdmin and un.funcCheckAdmin.
*/

/*
================================================================================
EXODUS.NSI
================================================================================
*/

/* installer control defines, check before making the final build  */
;!define DEBUG ; yes this is what you are thinking it is...
;!define USE_HKLM_KEY ; hookplace in case ever the registry will switch to HKLM

!ifdef DEBUG
    !warning "$\r$\nATTENTION:  the DEBUG define is SET, make sure you disable the$\r$\n$\t$\tdefine for production!"
    !define MUI_VERBOSE "1"
!endif
!ifdef USE_HKLM_KEY
    !warning "$\r$\nATTENTION:  the USE_HKLM_KEY define is SET, make sure you are$\r$\n$\t$\tbuilding Exodus with HKLM support. If not the$\r$\n$\t$\tinstaller will read and write to the wrong registry keys!"
!endif

/*  includes  */
!addincludedir "."
!addincludedir ".."
!addincludedir "plugins"
!addincludedir "${NSISDIR}\Include"
!addincludedir "..\redist"
!addplugindir  "..\redist"

!include "MUI.nsh"
!include "Sections.nsh"
!include "StrFunc.nsh"

/*
   ZipDLL.nsh was created for Modern UI 1.62 so this workaround is needed for it
   to accept current Modern UI version (the other way is to edit ZipDLL.nsh and
   replace MUI_MACROS_USED by MUI_INCLUDED at the top of the file).
*/
!ifdef MUI_INCLUDED
    !ifndef MUI_MACROS_USED
        !define MUI_MACROS_USED
    !endif
    !include "ZipDLL.nsh"
!endif

!include "version.nsi" ; you might want to edit version.pl to rename this file
                       ; version.nsh since it's a header inclusion (yes I know
                       ; I'm a purist)
!include "locale-new.nsh"

/*
================================================================================
REAL STUFF STARTS HERE
================================================================================
*/

/*  defines */
; basic installer options
!define PRODUCT "Exodus"
!define PRODUCT_COPYRIGHT "GNU Public License (GPL)"
!define PRODUCT_COMMENTS "This is free! Promote Jabber and give it to a friend."
!define PRODUCT_COMPANY "Jabber.org"
!define JABBER_REGISTRY_KEY "SOFTWARE\Jabber"
!define PRODUCT_REGISTRY_KEY "${JABBER_REGISTRY_KEY}\${PRODUCT}"
!define PRODUCT_INSTALL_PATH_KEY "Install_Dir"
!define PRODUCT_RUN_KEY "Software\Microsoft\Windows\CurrentVersion\Run"
!define PRODUCT_LOCALES_KEY "InstallLocales"
!define PRODUCT_PREFS_FILE_KEY "prefs_file"
!define PRODUCT_UNINSTALL_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}"
!define PRODUCT_RESTART_KEY "${PRODUCT_REGISTRY_KEY}\Restart"
!define PRODUCT_RESTART_CWD_KEY "cwd"
!define PRODUCT_RESTART_CMDLINE_KEY "cmdline"
!define PRODUCT_UNINSTALL_COMMAND_KEY "UninstallString"
!define PRODUCT_UNINSTALL_DISPLAY_KEY "DisplayName"
!define PRODUCT_UNINSTALL_DISPLAY_VAL "${PRODUCT} Jabber Client (remove only)"
!define PRODUCT_WINDOWCLASS "TfrmExodus"
!define PRODUCT_UNINSTALLER "Uninstall"
!define PLUGINS_PATH "${NSISDIR}\Plugins\"
!define SYSTEMDLL_FILENAME "System"
!define ZIPDLL_FILENAME "ZipDLL"
!define ZIPDLL_PATH "..\redist\"
!define EXEC_EXTENSION ".exe"
!define DLL_EXTENSION ".dll"
!define ICON_EXTENSION ".ico"
!define BITMAP_EXTENSION ".bmp"
!define INI_EXTENSION ".ini"
!define LINK_EXTENSION ".lnk"
!define XMPP_EXTENSION ".xmpp"
!define ZIP_EXTENSION ".zip"
!define TEXT_EXTENSION ".txt"
!define XML_EXTENSION ".xml"
!define MAP_EXTENSION ".map"
!define INSTALLER_WELCOME_BITMAP \
        "${NSISDIR}\Contrib\Graphics\Wizard\nsis.bmp" ; not standard
!define INSTALLER_LANGUAGE_KEY "Language"
!define INSTALLER_STARTMENU_KEY "StartMenu"
!define INSTALLER_SWITCH_SILENT "/S"

!ifdef NO_NETWORK
    !define INSTALLER_OUTPUT "setup-standalone"
!else
    !define INSTALLER_OUTPUT "setup"
!endif

/* PLUGIN URLS */
!define PLUGINS_DIR "plugins"
!define GOOGLECODE_DOWNLOAD_DIR "files"
!ifdef DAILY
     ; BRANDING: Change this PATH if different
    !define PLUGINS_DOWNLOAD_PATH "daily/${PLUGINS_DIR}"
!else
    !define PLUGINS_DOWNLOAD_PATH "${GOOGLECODE_DOWNLOAD_DIR}"
!endif


/* ALL OF OUR CORE STRINGS */
!define NSISDL_SUCCESSFUL "success"
!define MSN_EMOTICONS "msn_emoticons"
!define YAHOO_EMOTICONS "yahoo_emoticons"
!define IDLEHOOKS "IdleHooks"
!define LIBIDN "libidn"
!define SSLEAY "ssleay32"
!define LIBEAY "libeay32"
!define SQLITE "sqlite3"
!define TNGIMAGE "libmng"
!define VCL "..\redist\vcl100.bpl"
!define RTL "..\redist\rtl100.bpl"
!define XMPPFILE "XMPPfile"
!define CONTENT_TYPE_KEY "Content Type"
!define XMPP_CONTENT_TYPE "application/xmpp"
!define XMPP_DESC "eXtensible Messaging and Presence Protocol"
!define EDIT_FLAGS_KEY "EditFlags"
!define XMPP_EDIT_FLAGS "0x10000"
!define BROWSER_FLAGS_KEY "BrowserFlags"
!define XMPP_BROWSER_FLAGS "0x8"
!define XMPP_SHELL_KEY "XMPPfile\shell"
!define SHELL_OPEN_KEY "Open"
!define XMPP_SHELL_OPEN_COMMAND_KEY "${XMPP_SHELL_KEY}\${SHELL_OPEN_KEY}\command"
!define XMPP_SHELL_OPEN_COMMAND_VAL "-o '%1'"
!define XMPP_SHELL_OPEN_DDE_KEY "${XMPP_SHELL_KEY}\${SHELL_OPEN_KEY}\ddeexec"
!define XMPP_SHELL_OPEN_DDE_VAL "${SHELL_OPEN_KEY} '%1'"
!define XMPP_SHELL_OPEN_DDE_APP_KEY "${XMPP_SHELL_OPEN_DDE_KEY}\Application"
!define XMPP_SHELL_OPEN_DDE_IF_KEY "${XMPP_SHELL_OPEN_DDE_KEY}\IfExec"
!define IGNORE_KEY "ignore"
!define XMPP_SHELL_OPEN_DDE_TOPIC_KEY "${XMPP_SHELL_OPEN_DDE_KEY}\Topic"
!define XMPP_ACTION "XMPPAction"
!define XMPP_MIME_KEY "MIME\Database\${CONTENT_TYPE_KEY}\application/xmpp"
!define EXTENSION_KEY "Extension"
!define SSL_INSTALLER "indy_openssl096k"
!define README "readme"
!define HOMEPAGE "Homepage"
!define BRANDING_FILE "branding"
!define LOCALE "locale"
!define XML_TAG_SEPARATORS "><"
!define XML_ML_TAG_SEPARATORS ">$\r$\n<"
!define LOG_PATH_XML_TAG 'log_path value="'
!define XML_TAG_END '"/'

; BRANDING: change this URL
!ifdef STAGE
    !define HOME_URL "http://192.168.1.1/stage"
!else
    !define HOME_URL "http://exodus.googlecode.com"
!endif

/*
================================================================================
Modern UI Settings
================================================================================
*/
!ifndef DEBUG
    !define MUI_ABORTWARNING
    !define MUI_UNABORTWARNING
!endif
!define MUI_ICON "${PRODUCT}${ICON_EXTENSION}"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "${PRODUCT}-installer${BITMAP_EXTENSION}"
!define MUI_WELCOMEFINISHPAGE_BITMAP "${INSTALLER_WELCOME_BITMAP}"
!define MUI_FINISHPAGE_NOAUTOCLOSE
!ifdef USE_HKLM_KEY
    !define MUI_LANGDLL_REGISTRY_ROOT HKLM
!else
    !define MUI_LANGDLL_REGISTRY_ROOT HKCU
!endif
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_REGISTRY_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "${INSTALLER_LANGUAGE_KEY}"
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "${PRODUCT}"
!ifdef USE_HKLM_KEY
    !define MUI_STARTMENUPAGE_REGISTRY_ROOT HKLM
!else
    !define MUI_STARTMENUPAGE_REGISTRY_ROOT HKCU
!endif
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_REGISTRY_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${INSTALLER_STARTMENU_KEY}"
!define MUI_LICENSEPAGE_TEXT_TOP  \
    "Exodus is licensed under the GPL.  Press Page Down to see the rest of the agreement."
!define MUI_FINISHPAGE_RUN "$INSTDIR\${PRODUCT}${EXEC_EXTENSION}"
!define MUI_FINISHPAGE_RUN_NOTCHECKED

!define MUI_UNICON "${MUI_ICON}"
!define MUI_HEADERIMAGE_UNBITMAP "${MUI_HEADERIMAGE_BITMAP}"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "${MUI_WELCOMEFINISHPAGE_BITMAP}"
!define MUI_UNFINISHPAGE_NOAUTOCLOSE
;!define MUI_UNINSTALLER ; redundant by other MUI_UN macros


/*
    global variables
*/
; Modern UI variables
Var STARTMENU_FOLDER


/*
    compression and CRC options
*/
CRCCheck on
!ifndef DEBUG
    SetCompress auto ; no effect unless the compression method is zlib
    SetCompressor lzma ; I still don't know why isn't this the default
    SetDatablockOptimize on ; reduces size a lot
!endif


/*
================================================================================
    Modern UI Pages
================================================================================
*/
; Installer pages
; !insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE $(GPL_LICENSE_FILE)
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_STARTMENU Application "$STARTMENU_FOLDER"
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
/*
    I changed this quite a bit 'cause I got angry because the uninstaller
    just unistalled Exodus without giving a second chance to cancel.
*/
!insertmacro MUI_UNPAGE_CONFIRM
;!insertmacro MUI_UNPAGE_LICENSE $(GPL_LICENSE_FILE)
;!insertmacro MUI_UNPAGE_COMPONENTS
;!insertmacro MUI_UNPAGE_DIRECTORY
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

/*
================================================================================
 Modern UI Languages (first is default language)
================================================================================
*/
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Catalan"
!insertmacro MUI_LANGUAGE "Czech"
!insertmacro MUI_LANGUAGE "Danish"
!insertmacro MUI_LANGUAGE "German"
!insertmacro MUI_LANGUAGE "Spanish"
!insertmacro MUI_LANGUAGE "French"
!insertmacro MUI_LANGUAGE "Japanese"
!insertmacro MUI_LANGUAGE "Korean"
!insertmacro MUI_LANGUAGE "Lithuanian"
!insertmacro MUI_LANGUAGE "Dutch"
!insertmacro MUI_LANGUAGE "Norwegian"
!insertmacro MUI_LANGUAGE "Polish"
!insertmacro MUI_LANGUAGE "PortugueseBR"
!insertmacro MUI_LANGUAGE "Portuguese"
!insertmacro MUI_LANGUAGE "Russian"
!insertmacro MUI_LANGUAGE "Slovenian"
!insertmacro MUI_LANGUAGE "TradChinese"
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
ReserveFile "${PLUGINS_PATH}${SYSTEMDLL_FILENAME}${DLL_EXTENSION}"
ReserveFile "${ZIPDLL_PATH}${ZIPDLL_FILENAME}${DLL_EXTENSION}"

/*
================================================================================
    localization stuff
================================================================================
*/
!include "un-macros.nsh"

/* StrFunc.nsh calls (these functions need to be initialized) */
${StrStr}
; And these also until the StrFunc.nsh gets fixed to allow
; inclusion in the Uninstaller sections.
${un.StrRep}
${un.StrStrAdv}

!include "strings.nsh"
!include "version-i18n.nsh"
!include "functions.nsh"

/*
    include the installer plugin sections localization

    BRANDING: Make sure to modify the following files in
    the plugin directory to match the set of plugins you
    wish to distribute:
        plugin-locale-new.nsh
        plugin-sections-new.nsi
        plugin-desc-new.nsi
        plugin-i18n-new.nsi
*/

!include "plugin-i18n-new.nsh"

/*
================================================================================
    commands
================================================================================
*/
; The file to write
Name "${PRODUCT} ${EXODUS_VERSION}"
OutFile "${INSTALLER_OUTPUT}${EXEC_EXTENSION}"
!ifdef DEBUG ; don't know if there is a reason for the forced show but I'll risk it
    ShowInstDetails show
    ShowUninstDetails show
!else
    ShowInstDetails hide
    ShowUninstDetails hide
!endif

; The default installation directory
InstallDir "$PROGRAMFILES\${PRODUCT}"
; Registry key to check for directory (so if you install again, it will
; overwrite the old one automatically)
!ifdef USE_HKLM_KEY
    InstallDirRegKey HKLM "${PRODUCT_REGISTRY_KEY}" "${PRODUCT_INSTALL_PATH_KEY}"
!else
    InstallDirRegKey HKCU "${PRODUCT_REGISTRY_KEY}" "${PRODUCT_INSTALL_PATH_KEY}"
!endif


/*
================================================================================
MAIN APPLICATION SECTION
================================================================================
*/
Section Exodus SEC_Exodus
    ; shut down running instances
    SectionIn RO
    Call NotifyInstances

    ; Set output path to the installation directory.
    SetOutPath $INSTDIR
    File "${PRODUCT}${EXEC_EXTENSION}"
    File "${IDLEHOOKS}${DLL_EXTENSION}"
    File "${MSN_EMOTICONS}${DLL_EXTENSION}"
    File "${YAHOO_EMOTICONS}${DLL_EXTENSION}"
    File "${LIBIDN}${DLL_EXTENSION}"
    File "${SSLEAY}${DLL_EXTENSION}";
    File "${LIBEAY}${DLL_EXTENSION}";
    File "${VCL}"
    File "${RTL}"
    File "..\redist\${SQLITE}${DLL_EXTENSION}"
    File "..\redist\${TNGIMAGE}${DLL_EXTENSION}"

    ; Daily builds should include the MAP file to get detailed AV reports.
    !ifdef DAILY
        File "${PRODUCT}${MAP_EXTENSION}"
    !endif

    ; BRANDING: Uncomment if you are doing a branded setup.
    ; SetOverwrite off ; only if you don't want to overwrite existing file.
    ; File "${BRANDING_FILE}${XML_EXTENSION}"
    ; SetOverwrite on

    ; Create the plugins dir, and lay down the default logger
    CreateDirectory "$INSTDIR\${PLUGINS_DIR}"
    SetOutPath "$INSTDIR\${PLUGINS_DIR}"
    File "plugins\ExHTMLLogger.dll"

    ; Make sure exodus is registered, for Win95 and NT4
    ; We need to do this to ensure that plugins can register properly.
    ExecWait '"$INSTDIR\${PRODUCT}${EXEC_EXTENSION}" -0'


    /*
    ---------------------------------------------------------------------------
    Write the installation and uninstaller paths into the registry
    ---------------------------------------------------------------------------
    */
    !ifdef USE_HKLM_KEY
        WriteRegStr HKLM "${PRODUCT_REGISTRY_KEY}" "${PRODUCT_INSTALL_PATH_KEY}" "$INSTDIR"
    !else
        WriteRegStr HKCU "${PRODUCT_REGISTRY_KEY}" "${PRODUCT_INSTALL_PATH_KEY}" "$INSTDIR"
    !endif

    ; Write the uninstall keys for Windows
    WriteRegStr HKLM "${PRODUCT_UNINSTALL_KEY}" "${PRODUCT_UNINSTALL_DISPLAY_KEY}" \
        "${PRODUCT_UNINSTALL_DISPLAY_VAL}"
    WriteRegStr HKLM "${PRODUCT_UNINSTALL_KEY}" "${PRODUCT_UNINSTALL_COMMAND_KEY}" \
        '"$INSTDIR\${PRODUCT_UNINSTALLER}${EXEC_EXTENSION}"'
    WriteUninstaller "${PRODUCT_UNINSTALLER}${EXEC_EXTENSION}"

    /*
    ---------------------------------------------------------------------------
    register file associations.  TODO: figure this out for real, and
    remove these semi-bogus ones.
    ---------------------------------------------------------------------------
    */
    WriteRegStr HKCR "${XMPP_EXTENSION}" "" "${XMPPFILE}"
    WriteRegStr HKCR "${XMPP_EXTENSION}" "${CONTENT_TYPE_KEY}" "${XMPP_CONTENT_TYPE}"
    WriteRegStr HKCR "${XMPPFILE}" "" "${XMPP_DESC}"
    WriteRegDword HKCR "${XMPPFILE}" "${EDIT_FLAGS_KEY}" "${XMPP_EDIT_FLAGS}"
    WriteRegDword HKCR "${XMPPFILE}" "${BROWSER_FLAGS_KEY}" "${XMPP_BROWSER_FLAGS}"
    WriteRegStr HKCR "${XMPP_SHELL_KEY}" "" "${SHELL_OPEN_KEY}"
    WriteRegStr HKCR "${XMPP_SHELL_OPEN_COMMAND_KEY}" "" "$INSTDIR\${PRODUCT}${EXEC_EXTENSION} ${XMPP_SHELL_OPEN_COMMAND_VAL}"
    WriteRegStr HKCR "${XMPP_SHELL_OPEN_DDE_KEY}" "" "${XMPP_SHELL_OPEN_DDE_VAL}"
    WriteRegStr HKCR "${XMPP_SHELL_OPEN_DDE_APP_KEY}" "" "${PRODUCT}"
    WriteRegStr HKCR "${XMPP_SHELL_OPEN_DDE_IF_KEY}" "" "${IGNORE_KEY}"
    WriteRegStr HKCR "${XMPP_SHELL_OPEN_DDE_TOPIC_KEY}" "" "${XMPP_ACTION}"
    WriteRegStr HKCR "${XMPP_MIME_KEY}" "${EXTENSION_KEY}" "${XMPP_EXTENSION}"

/* register xmpp:, im:, and pres: */
WriteRegStr HKEY_CLASSES_ROOT "xmpp" "" "URL:xmpp"
WriteRegStr HKEY_CLASSES_ROOT "xmpp" "URL Protocol" ""
WriteRegStr HKEY_CLASSES_ROOT "xmpp\DefaultIcon" "" "c:\Program Files\Exodus\Exodus.exe"
WriteRegStr HKEY_CLASSES_ROOT "xmpp\shell" "" ""
WriteRegStr HKEY_CLASSES_ROOT "xmpp\shell\Open" "" ""
WriteRegStr HKEY_CLASSES_ROOT "xmpp\shell\Open\command" "" "C:\Program Files\Exodus\Exodus.exe -u '%1'"
WriteRegStr HKEY_CLASSES_ROOT "xmpp\shell\Open\ddeexec" "" "URI '%1'"
WriteRegStr HKEY_CLASSES_ROOT "xmpp\shell\Open\ddeexec\Application" "" "Exodus"
WriteRegStr HKEY_CLASSES_ROOT "xmpp\shell\Open\ddeexec\IfExec" "" "ignore"
WriteRegStr HKEY_CLASSES_ROOT "xmpp\shell\Open\ddeexec\Topic" "" "XMPPAction"
WriteRegStr HKEY_CLASSES_ROOT "im" "" "URL:im"
WriteRegStr HKEY_CLASSES_ROOT "im" "URL Protocol" ""
WriteRegStr HKEY_CLASSES_ROOT "im\DefaultIcon" "" "c:\Program Files\Exodus\Exodus.exe"
WriteRegStr HKEY_CLASSES_ROOT "im\shell" "" ""
WriteRegStr HKEY_CLASSES_ROOT "im\shell\Open" "" ""
WriteRegStr HKEY_CLASSES_ROOT "im\shell\Open\command" "" "C:\Program Files\Exodus\Exodus.exe -u '%1'"
WriteRegStr HKEY_CLASSES_ROOT "im\shell\Open\ddeexec" "" "URI '%1'"
WriteRegStr HKEY_CLASSES_ROOT "im\shell\Open\ddeexec\Application" "" "Exodus"
WriteRegStr HKEY_CLASSES_ROOT "im\shell\Open\ddeexec\IfExec" "" "ignore"
WriteRegStr HKEY_CLASSES_ROOT "im\shell\Open\ddeexec\Topic" "" "XMPPAction"
WriteRegStr HKEY_CLASSES_ROOT "pres" "" "URL:pres"
WriteRegStr HKEY_CLASSES_ROOT "pres" "URL Protocol" ""
WriteRegStr HKEY_CLASSES_ROOT "pres\DefaultIcon" "" "c:\Program Files\Exodus\Exodus.exe"
WriteRegStr HKEY_CLASSES_ROOT "pres\shell" "" ""
WriteRegStr HKEY_CLASSES_ROOT "pres\shell\Open" "" ""
WriteRegStr HKEY_CLASSES_ROOT "pres\shell\Open\command" "" "C:\Program Files\Exodus\Exodus.exe -u '%1'"
WriteRegStr HKEY_CLASSES_ROOT "pres\shell\Open\ddeexec" "" "URI '%1'"
WriteRegStr HKEY_CLASSES_ROOT "pres\shell\Open\ddeexec\Application" "" "Exodus"
WriteRegStr HKEY_CLASSES_ROOT "pres\shell\Open\ddeexec\IfExec" "" "ignore"
WriteRegStr HKEY_CLASSES_ROOT "pres\shell\Open\ddeexec\Topic" "" "XMPPAction"

    ;sound notification events
    WriteRegStr HKCU "AppEvents\EventLabels\${PRODUCT}_notify_chatactivity" "" $(SN_Chatactivity)
    WriteRegStr HKCU "AppEvents\EventLabels\${PRODUCT}_notify_invite" "" $(SN_Invite)
    WriteRegStr HKCU "AppEvents\EventLabels\${PRODUCT}_notify_keyword" "" $(SN_Keyword)
    WriteRegStr HKCU "AppEvents\EventLabels\${PRODUCT}_notify_newchat" "" $(SN_Newchat)
    WriteRegStr HKCU "AppEvents\EventLabels\${PRODUCT}_notify_normalmsg" "" $(SN_Normalmsg)
    WriteRegStr HKCU "AppEvents\EventLabels\${PRODUCT}_notify_offline" "" $(SN_Offline)
    WriteRegStr HKCU "AppEvents\EventLabels\${PRODUCT}_notify_online" "" $(SN_Online)
    WriteRegStr HKCU "AppEvents\EventLabels\${PRODUCT}_notify_roomactivity" "" $(SN_Roomactivity)
    WriteRegStr HKCU "AppEvents\EventLabels\${PRODUCT}_notify_s10n" "" $(SN_S10n)
    WriteRegStr HKCU "AppEvents\EventLabels\${PRODUCT}_notify_oob" "" $(SN_OOB)
    WriteRegStr HKCU "AppEvents\EventLabels\${PRODUCT}_notify_autoresponse" "" $(SN_AutoResponse)
    ;sound schemes
    WriteRegStr HKCU "AppEvents\Schemes\Apps\${PRODUCT}" "" ${PRODUCT}
    WriteRegStr HKCU "AppEvents\Schemes\Apps\${PRODUCT}\${PRODUCT}_notify_chatactivity" "" ""
    WriteRegStr HKCU "AppEvents\Schemes\Apps\${PRODUCT}\${PRODUCT}_notify_invite" "" ""
    WriteRegStr HKCU "AppEvents\Schemes\Apps\${PRODUCT}\${PRODUCT}_notify_keyword" "" ""
    WriteRegStr HKCU "AppEvents\Schemes\Apps\${PRODUCT}\${PRODUCT}_notify_newchat" "" ""
    WriteRegStr HKCU "AppEvents\Schemes\Apps\${PRODUCT}\${PRODUCT}_notify_normalmsg" "" ""
    WriteRegStr HKCU "AppEvents\Schemes\Apps\${PRODUCT}\${PRODUCT}_notify_offline" "" ""
    WriteRegStr HKCU "AppEvents\Schemes\Apps\${PRODUCT}\${PRODUCT}_notify_online" "" ""
    WriteRegStr HKCU "AppEvents\Schemes\Apps\${PRODUCT}\${PRODUCT}_notify_roomactivity" "" ""
    WriteRegStr HKCU "AppEvents\Schemes\Apps\${PRODUCT}\${PRODUCT}_notify_s10n" "" ""
    WriteRegStr HKCU "AppEvents\Schemes\Apps\${PRODUCT}\${PRODUCT}_notify_oob" "" ""
    WriteRegStr HKCU "AppEvents\Schemes\Apps\${PRODUCT}\${PRODUCT}_notify_autoresponse" "" ""

SectionEnd ; end the section

/*
================================================================================
Plugins sub-section
================================================================================
*/
SubSection "$(NAME_Plugins)" SEC_Plugins
    !include "plugin-sections-new.nsi"
SubSectionEnd

/*
================================================================================
Extra Shell Shortcuts
================================================================================
*/
SubSection "$(NAME_SHELL)" SEC_Shell

    Section "Desktop Shortcut" SEC_Desktop
        ; if we're in silent mode, don't do any of the shell stuff, ever.
        Push "${INSTALLER_SWITCH_SILENT}"
        Call funcGetConfigParam
        Pop $0
        IntCmpU '$0' '1' silent1

        !ifdef USE_HKLM_KEY
            SetShellVarContext all
        !else
            SetShellVarContext current
        !endif
        CreateShortcut "$DESKTOP\${PRODUCT}${LINK_EXTENSION}" "$INSTDIR\${PRODUCT}${EXEC_EXTENSION}"

        silent1:
	SectionEnd

	Section "Quicklaunch Shortcut" SEC_Quicklaunch
        Push "${INSTALLER_SWITCH_SILENT}"
        Call funcGetConfigParam
        Pop $0
        IntCmpU '$0' '1' silent2

        !ifdef USE_HKLM_KEY
            SetShellVarContext all
        !else
            SetShellVarContext current
        !endif
        CreateShortcut "$QUICKLAUNCH\${PRODUCT}${LINK_EXTENSION}" "$INSTDIR\${PRODUCT}${EXEC_EXTENSION}"

        silent2:
    SectionEnd

    Section "Start Exodus with Windows" SEC_AutoStart
        Push "${INSTALLER_SWITCH_SILENT}"
        Call funcGetConfigParam
        Pop $0
        IntCmpU '$0' '1' silent3

        !ifdef USE_HKLM_KEY
            SetShellVarContext all
            WriteRegStr HKLM "${PRODUCT_RUN_KEY}" "${PRODUCT}" "$INSTDIR\${PRODUCT}${EXEC_EXTENSION}"
        !else
            SetShellVarContext current
            WriteRegStr HKCU "${PRODUCT_RUN_KEY}" "${PRODUCT}" "$INSTDIR\${PRODUCT}${EXEC_EXTENSION}"
        !endif

        silent3:
    SectionEnd
SubSectionEnd

/*
================================================================================
Start | Programs Shortcuts
================================================================================
*/
Section "" SEC_Menu
    ; if in silent mode, don't do any of the menu stuff, ever
    Push "${INSTALLER_SWITCH_SILENT}"
    Call funcGetConfigParam
    Pop $0
    IntCmpU '$0' '1' silent
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    !ifdef USE_HKLM_KEY
        SetShellVarContext all
    !else
        SetShellVarContext current
    !endif
    CreateDirectory "$SMPROGRAMS\$STARTMENU_FOLDER"
    CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\${PRODUCT_UNINSTALLER}${LINK_EXTENSION}" \
        "$INSTDIR\${PRODUCT_UNINSTALLER}${EXEC_EXTENSION}"
    CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\${PRODUCT}${LINK_EXTENSION}" "$INSTDIR\${PRODUCT}${EXEC_EXTENSION}"

    ; BRANDING: Change this URL
    CreateShortCut \
        "$SMPROGRAMS\$STARTMENU_FOLDER\${PRODUCT} ${HOMEPAGE}${LINK_EXTENSION}" \
        "${HOME_URL}"
    !insertmacro MUI_STARTMENU_WRITE_END

  silent:
SectionEnd

/*
================================================================================
DAILY UPDATES
BRANDING: Remove this section
================================================================================
*/
Section /o "$(NAME_Bleed)" SEC_Bleed
    SetOverwrite off
    File "${BRANDING_FILE}${XML_EXTENSION}"
    SetOverwrite on
SectionEnd

/*
================================================================================
LOCALE SECTION
================================================================================
*/
Section /o "$(NAME_Locale)" SEC_Locale
    File "${LOCALE}${ZIP_EXTENSION}"
    !insertmacro MUI_ZIPDLL_EXTRACTALL "$INSTDIR\${LOCALE}${ZIP_EXTENSION}" "$INSTDIR"
    Delete "$INSTDIR\${LOCALE}${ZIP_EXTENSION}"
    !ifdef USE_HKLM_KEY
        WriteRegStr HKLM "${PRODUCT_REGISTRY_KEY}" "${PRODUCT_LOCALES_KEY}" "1"
    !else
        WriteRegStr HKCU "${PRODUCT_REGISTRY_KEY}" "${PRODUCT_LOCALES_KEY}" "1"
    !endif
SectionEnd

/*
================================================================================
special uninstall section.
================================================================================
*/
Section "Uninstall"
    ; remove shortcuts
    !insertmacro MUI_STARTMENU_GETFOLDER Application "$0"
    !ifdef USE_HKLM_KEY
        SetShellVarContext all
    !else
        SetShellVarContext current
    !endif

    StrCmp "$0" "" noshortcuts
    Delete /REBOOTOK "$SMPROGRAMS\$0\${PRODUCT_UNINSTALLER}${LINK_EXTENSION}"
    Delete /REBOOTOK "$SMPROGRAMS\$0\${PRODUCT}${LINK_EXTENSION}"
    Delete /REBOOTOK "$SMPROGRAMS\$0\${PRODUCT} ${HOMEPAGE}${LINK_EXTENSION}"
    RMDir /REBOOTOK "$SMPROGRAMS\$0"

  noshortcuts:
    ; remove shell hooks
    Delete /REBOOTOK "$DESKTOP\${PRODUCT}${LINK_EXTENSION}"
    Delete /REBOOTOK "$QUICKLAUNCH\${PRODUCT}${LINK_EXTENSION}"

!warning "$\r$\nATTENTION:  The UnRegDLL command is making the uninstaller crash.$\r$\n$\t$\tIt was disabled, chech the source starting at line: ${__LINE__}"
/*
    ; unregister all of the plugin .dll's
    ClearErrors
    FindFirst "$0" "$1" "$INSTDIR\${PLUGINS_DIR}\*${DLL_EXTENSION}"
    IfErrors dllregdone
  nextdll:
    UnRegDLL "$INSTDIR\${PLUGINS_DIR}\$1"
    ClearErrors
    FindNext "$0" "$1"
    IfErrors dllregdone nextdll
  dllregdone:
    FindClose "$0"
*/
    ; remove plugins
    RMDir /r "$INSTDIR\${PLUGINS_DIR}"

    ; remove localization files
    RMDir /r "$INSTDIR\${LOCALE}"

    ; remove files
    Delete /REBOOTOK "$INSTDIR\${PRODUCT}${EXEC_EXTENSION}"
    Delete /REBOOTOK "$INSTDIR\${IDLEHOOKS}${DLL_EXTENSION}"
    Delete /REBOOTOK "$INSTDIR\${MSN_EMOTICONS}${DLL_EXTENSION}"
    Delete /REBOOTOK "$INSTDIR\${YAHOO_EMOTICONS}${DLL_EXTENSION}"
    Delete /REBOOTOK "$INSTDIR\${BRANDING_FILE}${XML_EXTENSION}"
    Delete /REBOOTOK "$INSTDIR\${LIBEAY}${DLL_EXTENSION}"
    Delete /REBOOTOK "$INSTDIR\${SSLEAY}${DLL_EXTENSION}"
    Delete /REBOOTOK "$INSTDIR\${SQLITE}${DLL_EXTENSION}"
    Delete /REBOOTOK "$INSTDIR\${ICUIN}${DLL_EXTENSION}"
    Delete /REBOOTOK "$INSTDIR\${ICUUC}${DLL_EXTENSION}"

    ; MUST REMOVE UNINSTALLER, too
    Delete /REBOOTOK "$INSTDIR\${PRODUCT_UNINSTALLER}${EXEC_EXTENSION}"
    ; Remove all files in the installation dir
    RMDir /REBOOTOK "$INSTDIR"

    ReadRegStr "$0" HKCU "${PRODUCT_REGISTRY_KEY}" "${PRODUCT_PREFS_FILE_KEY}"
    Delete /REBOOTOK "$0"
    DeleteRegValue HKCU "${PRODUCT_REGISTRY_KEY}" "${PRODUCT_PREFS_FILE_KEY}"

    ; XXX: Remove the user logs based on user input

    ; XXX: remove keys and files for every user

    ; remove registry keys
    !ifdef USE_HKLM_KEY
        DeleteRegKey HKLM "${PRODUCT_REGISTRY_KEY}"
        DeleteRegKey /ifempty HKLM "${JABBER_REGISTRY_KEY}"
        DeleteRegValue HKLM "${PRODUCT_RUN_KEY}" "${PRODUCT}"
    !else
        DeleteRegKey HKCU "${PRODUCT_REGISTRY_KEY}"
        DeleteRegKey /ifempty HKCU "${JABBER_REGISTRY_KEY}"
        DeleteRegValue HKCU "${PRODUCT_RUN_KEY}" "${PRODUCT}"
    !endif
    DeleteRegKey HKCR "${XMPP_EXTENSION}"
    DeleteRegKey HKCR "${XMPPFILE}"
    DeleteRegKey HKCR "${XMPP_MIME_KEY}"
    DeleteRegKey HKLM "${PRODUCT_UNINSTALL_KEY}"

    ;sound notification keys
    DeleteRegKey HKCU "AppEvents\EventLabels\${PRODUCT}_notify_chatactivity"
    DeleteRegKey HKCU "AppEvents\EventLabels\${PRODUCT}_notify_invite"
    DeleteRegKey HKCU "AppEvents\EventLabels\${PRODUCT}_notify_keyword"
    DeleteRegKey HKCU "AppEvents\EventLabels\${PRODUCT}_notify_newchat"
    DeleteRegKey HKCU "AppEvents\EventLabels\${PRODUCT}_notify_normalmsg"
    DeleteRegKey HKCU "AppEvents\EventLabels\${PRODUCT}_notify_offline"
    DeleteRegKey HKCU "AppEvents\EventLabels\${PRODUCT}_notify_online"
    DeleteRegKey HKCU "AppEvents\EventLabels\${PRODUCT}_notify_roomactivity"
    DeleteRegKey HKCU "AppEvents\EventLabels\${PRODUCT}_notify_s10n"
    DeleteRegKey HKCU "AppEvents\EventLabels\${PRODUCT}_notify_oob"
    DeleteRegKey HKCU "AppEvents\EventLabels\${PRODUCT}_notify_autoresponse"

    DeleteRegKey HKCU "AppEvents\Schemes\Apps\${PRODUCT}"
    
SectionEnd


/*
================================================================================
Modern install component descriptions
================================================================================
*/
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SEC_Exodus} $(DESC_Exodus)
    !insertmacro MUI_DESCRIPTION_TEXT ${SEC_Bleed} $(DESC_Bleed)
    !insertmacro MUI_DESCRIPTION_TEXT ${SEC_Locale} $(DESC_Locale)
    !insertmacro MUI_DESCRIPTION_TEXT ${SEC_Plugins} $(DESC_Plugins)
    !insertmacro MUI_DESCRIPTION_TEXT ${SEC_Shell} $(DESC_SHELL)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

; eof
