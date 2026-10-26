# Finance and Warehouse Reporting Pack for Business Central

![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg) ![Business Central 25+](https://img.shields.io/badge/Business%20Central-25%2B-0B7E8A) ![AL](https://img.shields.io/badge/language-AL-5C2D91)

**Read-only views that auditors and warehouse leads keep asking for, ready to open in Excel.**

<!-- DEMO: record a 30-60 second screen capture, save it as docs/images/demo.gif, then replace this comment with:
![Demo](docs/images/demo.gif) -->

> **Free and open source.** Want it installed, hosted or changed to fit your process? [Midstream Integrations](https://www.MidstreamIntegrations.com) does that. [Book a 20-minute call](https://midstreamintegrations.com/contact).

## What's included

- **G/L Entries - Audit View.** Every G/L entry with dimensions, source, balancing account, source code, and **created at / created by / modified at / modified by** shown as user names. Answers "who posted this?" without a developer.
- **Warehouse Receipts Outstanding** (query). Open warehouse receipt lines with quantities outstanding, to receive and received, plus vendor.
- **Posted Receipts - Invoicing Status** (query). Received vs. invoiced quantity per posted receipt line, including received-not-invoiced. Useful for month-end accruals.

All three can be found through Tell Me (search), filtered, and opened in Excel. The queries can also be published as web services for Power BI.

## Setup

Install and assign `MID REPORTING PACK`. There's nothing to configure.

## Install

**From a release (no build tools needed)**
1. Download the `.app` file from the latest [release](../../releases).
2. In Business Central, open **Extension Management** → **Manage** → **Upload Extension** and select the file.
3. Assign the permission set listed below to the people who use it.

**From source**
1. Clone this repo and open `FinanceWarehouseReportingPack` in VS Code with the [AL Language extension](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al).
2. Put your sandbox name and tenant ID in `.vscode/launch.json`, then run **AL: Download Symbols**.
3. Press **F5** to publish to your sandbox.

Always test in a sandbox before you install in production.

## Technical details

| | |
|---|---|
| Object ID range | 50210–50229 |
| Object prefix | `MID` |
| Dependencies | Base Application, System Application |
| Permission set(s) | `MID REPORTING PACK` |
| Business Central | Online, version 25 or later |

## Need help, or something this doesn't do?

[Midstream Integrations](https://www.MidstreamIntegrations.com) builds and supports Business Central extensions and integrations. We can:

- install and set up this app in your tenant and show your team how to use it
- change it to fit your process: fields, reports, layouts, approval rules
- build the integration you actually need: APIs, EDI, OCR, Python services, and connections between Business Central and the other systems you run

**[Book a 20-minute call](https://midstreamintegrations.com/contact)** · intro@MidstreamIntegrations.com

## Contributing

Issues and pull requests are welcome; see [CONTRIBUTING](https://github.com/Midstream-Integrations/.github/blob/main/CONTRIBUTING.md).
Found a security problem? Please follow the [security policy](https://github.com/Midstream-Integrations/.github/blob/main/SECURITY.md) instead of opening a public issue.

## License

[MIT](LICENSE) © Midstream Integrations
