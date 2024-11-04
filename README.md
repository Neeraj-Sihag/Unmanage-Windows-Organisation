# 🛠 Unmanage-Windows-Organisation

Remove the restrictive "managed by your organization" message from Windows settings with this script. This tool automates the deletion of specific registry keys, restoring user control over system settings.

## 🎯 Purpose

This project was created based on a solution shared by [Jonas The Swedish Goth](https://answers.microsoft.com/en-us/windows/forum/windows_10-other_settings/some-of-these-settings-are-hidden-or-managed-by/0f43eb7c-b01b-4615-8cf7-db047ac044aa) on the Microsoft Community forum, addressing issues where Windows incorrectly shows "managed by your organization" on personal devices. This script resolves the issue by removing leftover policies in the registry.

---

## 🚀 How to Run

### Cloning the Repository

To get started, first clone this repository to your local machine:
```bash
git clone https://github.com/Neeraj-Sihag/Unmanage-Windows-Organisation.git
```

Then, navigate into the repository folder:
```bash
cd Unmanage-Windows-Organisation
```

### Prerequisites

- **Admin Privileges**: Make sure you are running the script with administrator privileges.

### Running the Script

You can run **either** the PowerShell or the Batch version of the script. You **do not need to run both**, as they perform the same actions.

#### PowerShell Script

1. **Download the Script**: Clone this repository or download the `script.ps1` file.
2. **Run as Administrator**:
   - Open PowerShell as Administrator.
   - Navigate to the script location.
   - Run the script:
     ```powershell
     .\script.ps1
     ```
3. **Follow Prompts**:
   - The script will display its purpose and ask if you want to continue.
   - Confirm by entering "Yes" when prompted.
4. **Restart**: At the end, the script will ask if you want to restart your system to apply changes. Select "Yes" to restart immediately or "No" to restart later.

#### Batch Script

1. **Download the Script**: Clone this repository or download the `script.bat` file.
2. **Run as Administrator**:
   - Right-click the batch file and select **Run as administrator**.
3. **Follow Prompts**:
   - The script will display its purpose and ask if you want to continue.
   - Confirm by entering "Yes" when prompted.
4. **Restart**: The batch file will ask if you want to restart. Selecting "Yes" will restart immediately, while "No" allows you to restart later.

---

## 📝 What This Script Does

The script automates the deletion of specific registry keys that cause Windows to display the "managed by your organization" message. It checks for admin privileges, removes policy-related registry entries, and prompts you to restart to apply changes.

### Affected Registry Keys

This script targets the following registry paths:
- `HKCU\Software\Microsoft\Windows\CurrentVersion\Policies`
- `HKCU\Software\Microsoft\WindowsSelfHost`
- `HKCU\Software\Policies`
- `HKLM\Software\Microsoft\Policies`
- `HKLM\Software\Microsoft\Windows\CurrentVersion\Policies`
- `HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate`
- `HKLM\Software\Microsoft\WindowsSelfHost`
- `HKLM\Software\Policies`
- `HKLM\Software\WOW6432Node\Microsoft\Policies`
- `HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies`
- `HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate`

---

## ⚠️ Important Notes

- **Administrator Access**: You must run this script with administrator privileges for it to work.
- **Restart Required**: A system restart is required to apply the changes fully.
- **Disclaimer**: This script edits the Windows registry. Use it carefully and understand that modifying the registry can impact system behavior. 

---

## 📜 License

This project is open-source under the [MIT License](LICENSE).

---

Feel free to use, modify, or contribute to this project!
