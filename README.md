# 🛠️ The Punisher - Batch Utility Script by ! paulos

## 📌 Overview

**The Punisher** is a batch-based interactive command-line utility that provides several tools and functions — some of which are for security research or administrative purposes. This script features a dynamic ASCII UI, colored interface, and navigable menu with multiple tools.

---

## ⚙️ Features & Menu Options

### 1. **[WinRAR Cracker](https://github.com/EbolaMan-YT/WinRAR-Cracker)**
- **Description:** Executes `WinRAR.bat`, a script designed to attempt cracking or bypassing WinRAR archive passwords.
- **Inspiration:** This module was inspired by  
  https://github.com/EbolaMan-YT/WinRAR-Cracker
- **Password List** https://github.com/danielmiessler/SecLists/blob/master/Passwords/Common-Credentials/10-million-password-list-top-10000.txt
- **Location:** `code/WinRAR.bat`

### 2. **IP Tools**
- **Submenu includes:**
  - **My IP:** Displays the user's local IP address using the `ping` command.
  - **Target:** Placeholder for IP lookup or tracking (marked as "Under Development").
- **Uses:** Useful for IP retrieval and future integration of IP intelligence.

### 3. **Webhook Spammer**
- **Description:** Executes `WebhookSpammer.bat` to spam Discord (or other) webhooks.
- **Location:** `code/WebhookSpammer.bat`

### 4. **Dark Web Links**
- **Description:** Executes `darkweb.bat`, likely containing curated links or tools related to onion services.
- **Location:** `code/darkweb.bat`

### 5. **DOX Generator**
- **Description:** Prompts the user to input personal and technical data (Discord info, PC specs, phone data, personal identity).
- **Purpose:** Generates a comprehensive information file `info.txt`, structured with sections like DISCORD, PC, PHONE, PERSONAL, GEO, and LOGS.
- **Warning:** This could be used for unethical data collection. Use responsibly.

---

## 💡 How It Works

### General Flow
- Starts in the `code` directory.
- Displays an animated ASCII title screen.
- Presents a menu and waits for input.
- Each option calls a specific labeled section using `goto`.
- Text and info are styled using ANSI color codes (via `echo` statements).

### `DOX` Workflow
- Asks the user a long series of questions.
- Uses conditional logic to ask for system info if the user answers `yes`.
- Writes all input into a structured `info.txt` file with section headers and values.

---

## 🔐 Ethical Disclaimer

> ⚠️ **This script contains features that can be used for unethical, illegal, or malicious purposes.** These include:
> - Cracking software (WinRAR)
> - Gathering and storing sensitive user/system data
> - Discord token collection
> - Webhook spamming
> 
> **Use this tool responsibly, for educational or white-hat purposes only.**

---

## 🗂️ Files Required
- `WinRAR.bat` — WinRAR cracking logic  
- `WebhookSpammer.bat` — Webhook spammer script  
- `darkweb.bat` — List of dark web links or search tool  

Place all supporting files in the `code/` directory.

---

## 📦 Output
- `info.txt` — Stores the generated report from the DOX form.

## 🧾 License
This script is provided **as-is** for educational use only. The author is not responsible for misuse.
