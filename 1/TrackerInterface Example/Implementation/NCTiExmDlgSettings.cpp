//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   NCTiExmDlgSettings.cpp
//----------------------------------------------------------------------------
#include "TiExmpch.h"
#include "NCTiExmDlgSettings.h"
#include "TiInterface3.h"
#include "TiExmresource.h"
#include <atlstr.h>
#include <utility>
#include "NCTiExmDebug.h"

#pragma comment(lib, "comctl32.lib")


namespace
{
}


//----------------------------------------------------------------------------
// Function NCTiExmDlgSettings::NCTiExmDlgSettings
//----------------------------------------------------------------------------
NCTiExmDlgSettings::NCTiExmDlgSettings(bool bReadOnly, const NCTiExmSettings& crSettings)
: m_bReadOnly(bReadOnly)
, m_settings (crSettings)
{
}


//----------------------------------------------------------------------------
// Function NCTiExmDlgSettings::~NCTiExmDlgSettings
//----------------------------------------------------------------------------
NCTiExmDlgSettings::~NCTiExmDlgSettings()
{
}


//----------------------------------------------------------------------------
// Function NCTiExmDlgSettings::OnInitDialog
//----------------------------------------------------------------------------
// Description  : on init dialog
//----------------------------------------------------------------------------
LRESULT NCTiExmDlgSettings::OnInitDialog(UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled)
{
    UNREFERENCED_PARAMETER(uMsg);
    UNREFERENCED_PARAMETER(wParam);
    UNREFERENCED_PARAMETER(lParam);

    InitCommonControls();

    bHandled = TRUE;

    return 1;  // Let the system set the focus
}


//----------------------------------------------------------------------------
// Function NCTiExmDlgSettings::OnBnClickedOK
//----------------------------------------------------------------------------
// Description  : on OK
//----------------------------------------------------------------------------
LRESULT NCTiExmDlgSettings::OnBnClickedOK(WORD wNotifyCode, WORD wID, HWND hWndCtl, BOOL& bHandled)
{
    UNREFERENCED_PARAMETER(wNotifyCode);
    UNREFERENCED_PARAMETER(wID);
    UNREFERENCED_PARAMETER(hWndCtl);
    UNREFERENCED_PARAMETER(bHandled);

	EndDialog(wID);

	return 0;
}


//----------------------------------------------------------------------------
// Function NCTiExmDlgSettings::OnBnClickedCancel
//----------------------------------------------------------------------------
// Description  : on cancel
//----------------------------------------------------------------------------
LRESULT NCTiExmDlgSettings::OnBnClickedCancel(WORD wNotifyCode, WORD wID, HWND hWndCtl, BOOL& bHandled)
{
	UNREFERENCED_PARAMETER(wNotifyCode);
    UNREFERENCED_PARAMETER(wID);
    UNREFERENCED_PARAMETER(hWndCtl);
    UNREFERENCED_PARAMETER(bHandled);

    EndDialog(wID);
	
    return 0;
}
