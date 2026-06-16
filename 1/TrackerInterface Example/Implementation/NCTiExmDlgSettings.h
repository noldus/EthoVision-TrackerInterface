//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   ComponentsVts
// Module     :   TrackerInterface Example
// File       :   NCTiExmDlgSettings.h
//----------------------------------------------------------------------------
#ifndef NCTIEXMDLGSETTINGS_H
#define NCTIEXMDLGSETTINGS_H

#pragma once


#include "NCTiExmSettings.h"
#include "TiExmresource.h"
#include <atlwin.h>


//----------------------------------------------------------------------------
// class NCTiExmDlgSettings
//----------------------------------------------------------------------------
// Description: dialog
//----------------------------------------------------------------------------
class NCTiExmDlgSettings : public CDialogImpl<NCTiExmDlgSettings>
{
    typedef CDialogImpl<NCTiExmDlgSettings> base;

public:
                            NCTiExmDlgSettings      (bool bReadOnly, const NCTiExmSettings& crSettings);
    virtual                 ~NCTiExmDlgSettings     ();

    enum { IDD = IDD_TIEXM_SETTINGS };

    BEGIN_MSG_MAP(NCTiExmDlgSettings)
        MESSAGE_HANDLER(WM_INITDIALOG,          OnInitDialog)
        
        COMMAND_HANDLER(IDOK, BN_CLICKED,       OnBnClickedOK)
	    COMMAND_HANDLER(IDCANCEL, BN_CLICKED,   OnBnClickedCancel)
	
        //CHAIN_MSG_MAP(base)

    END_MSG_MAP()

    LRESULT                 OnInitDialog            (UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled);
	LRESULT                 OnBnClickedOK           (WORD wNotifyCode, WORD wID, HWND hWndCtl, BOOL& bHandled);
	LRESULT                 OnBnClickedCancel       (WORD wNotifyCode, WORD wID, HWND hWndCtl, BOOL& bHandled);
	
    NCTiExmSettings         GetSettings             () const;

private:
    bool                    m_bReadOnly;
    NCTiExmSettings         m_settings;
};


//----------------------------------------------------------------------------
// Function NCTiExmDlgSettings::GetSettings
//----------------------------------------------------------------------------
// Description  : get settings
//----------------------------------------------------------------------------
inline NCTiExmSettings NCTiExmDlgSettings::GetSettings() const
{
    return m_settings;
}


#endif //NCTIEXMDLGSETTINGS_H
