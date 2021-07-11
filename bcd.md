# BCD - Boot Configuration Data

Tools to edit or view [Registry](https://en.wikipedia.org/wiki/Windows_Registry) HIVE:

Good list of tools at [Ethical hacking and penetration testing](https://miloserdov.org/?p=5448).

| Tool              | Description                                   |
|-------------------|-----------------------------------------------|
| regedit.exe       | Original and native windows app               |
| mimikatz          | Windows PoC on SAM hive                       |
| RegRippy          | Python                                        |
| RegRipper         | Windows CLI                                   |
| Registry Explorer | Windows GUI                                   |
| creddump          | Python                                        |
| regipy            | Python                                        |
| chntpw            | Linux package, dump/alter credentials         |
| virt-win-reg      | Using libguestfs                              |
| Nirsoft tools     | bunch of utilities                            |
| winregfs          | Linux package: winregfs, Linux VFS/filesystem |
| libregf           | Linux package: libregf-utils                  |

* github:[mimikatz](https://github.com/gentilkiwi/mimikatz/wiki)
* [NirSoft](https://www.nirsoft.net/windows_registry_tools.html)

```bash
pipx install regipy
```

A __registry hive__ example:

```
# sha1sum bcd
49268b5e9710c8aa5a2fafc442b27aa28e1a7d7c  bcd
# sha256sum bcd
0448fc9bf8c0d5d8f8fed63ab15a64c28dfbef6196a0fda958098e293c89bcf6  bcd
```

Extracted content using `registry-dump bcd`:

noted: `[2021-07-11 13:37:19.184502] INFO: regipy.registry: Hive type for bcd was not identified: O\WinPXE\efi\microsoft\boot\bcd`

The actual content in json form:

```json
{
    "subkey_name": "Description",
    "path": "\\Description",
    "timestamp": "2014-09-19T01:36:35.579816+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "KeyName",
            "value": "\ufb20\uc342\u00a4\u0000\u1cbc\u92a2\u7fff\u0000\u0001",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "Description",
    "path": "\\Objects\\{0ce4991b-e6b3-4b16-b23c-5e0d9250e5d9}\\Description",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Type",
            "value": 537919488,
            "value_type": "REG_DWORD",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "16000020",
    "path": "\\Objects\\{0ce4991b-e6b3-4b16-b23c-5e0d9250e5d9}\\Elements\\16000020",
    "timestamp": "2014-09-19T01:31:17.388258+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": 0,
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "Elements",
    "path": "\\Objects\\{0ce4991b-e6b3-4b16-b23c-5e0d9250e5d9}\\Elements",
    "timestamp": "2014-09-19T01:31:17.388258+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "{0ce4991b-e6b3-4b16-b23c-5e0d9250e5d9}",
    "path": "\\Objects\\{0ce4991b-e6b3-4b16-b23c-5e0d9250e5d9}",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "Description",
    "path": "\\Objects\\{4636856e-540f-4170-a130-a84776f4c654}\\Description",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Type",
            "value": 537919488,
            "value_type": "REG_DWORD",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "15000011",
    "path": "\\Objects\\{4636856e-540f-4170-a130-a84776f4c654}\\Elements\\15000011",
    "timestamp": "2014-09-19T01:31:17.388258+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": 0,
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "15000013",
    "path": "\\Objects\\{4636856e-540f-4170-a130-a84776f4c654}\\Elements\\15000013",
    "timestamp": "2014-09-19T01:31:17.388258+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": 1,
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "15000014",
    "path": "\\Objects\\{4636856e-540f-4170-a130-a84776f4c654}\\Elements\\15000014",
    "timestamp": "2014-09-19T01:31:17.388258+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": 115200,
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "Elements",
    "path": "\\Objects\\{4636856e-540f-4170-a130-a84776f4c654}\\Elements",
    "timestamp": "2014-09-19T01:31:17.388258+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "{4636856e-540f-4170-a130-a84776f4c654}",
    "path": "\\Objects\\{4636856e-540f-4170-a130-a84776f4c654}",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "Description",
    "path": "\\Objects\\{6efb52bf-1766-41db-a6b3-0ee5eff72bd7}\\Description",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Type",
            "value": 538968067,
            "value_type": "REG_DWORD",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "14000006",
    "path": "\\Objects\\{6efb52bf-1766-41db-a6b3-0ee5eff72bd7}\\Elements\\14000006",
    "timestamp": "2014-09-19T01:31:17.403884+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": [
                "{7ea2e1ac-2e61-4728-aaa3-896d9d0a9f0e}",
                "{7ff607e0-4395-11db-b0de-0800200c9a66}"
            ],
            "value_type": "REG_MULTI_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "Elements",
    "path": "\\Objects\\{6efb52bf-1766-41db-a6b3-0ee5eff72bd7}\\Elements",
    "timestamp": "2016-12-26T06:44:40.245968+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "{6efb52bf-1766-41db-a6b3-0ee5eff72bd7}",
    "path": "\\Objects\\{6efb52bf-1766-41db-a6b3-0ee5eff72bd7}",
    "timestamp": "2016-12-26T06:44:40.245968+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "Description",
    "path": "\\Objects\\{7619dcc8-fafe-11d9-b411-000476eba25f}\\Description",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Type",
            "value": 805306368,
            "value_type": "REG_DWORD",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "31000003",
    "path": "\\Objects\\{7619dcc8-fafe-11d9-b411-000476eba25f}\\Elements\\31000003",
    "timestamp": "2014-09-19T01:31:17.419508+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "00000000000000000000000000000000050000000000000048000000000000000000000000000000000000000000000000000000000000000000000000000000",
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "32000004",
    "path": "\\Objects\\{7619dcc8-fafe-11d9-b411-000476eba25f}\\Elements\\32000004",
    "timestamp": "2014-09-19T01:31:17.419508+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "\\boot\\boot.sdi",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "Elements",
    "path": "\\Objects\\{7619dcc8-fafe-11d9-b411-000476eba25f}\\Elements",
    "timestamp": "2016-12-26T06:44:40.246966+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "{7619dcc8-fafe-11d9-b411-000476eba25f}",
    "path": "\\Objects\\{7619dcc8-fafe-11d9-b411-000476eba25f}",
    "timestamp": "2016-12-26T06:44:40.246966+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "Description",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Description",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Type",
            "value": 270532611,
            "value_type": "REG_DWORD",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "11000001",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\11000001",
    "timestamp": "2014-09-19T01:36:18.318576+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "c8dc1976fefad911b411000476eba25f0000000001000000a0000000000000000300000000000000000000000000000000000000000000000100000078000000",
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "12000002",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\12000002",
    "timestamp": "2014-09-19T01:36:18.318576+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "\\windows\\system32\\boot\\winload.efi",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "12000004",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\12000004",
    "timestamp": "2014-09-19T01:36:18.318576+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "Windows Setup",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "12000005",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\12000005",
    "timestamp": "2014-09-19T01:36:18.318576+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "en-US",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "12000030",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\12000030",
    "timestamp": "2016-12-26T06:44:57.486558+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "DISABLE_INTEGRITY_CHECKS",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "14000006",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\14000006",
    "timestamp": "2014-09-19T01:36:18.318576+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": [
                "{6efb52bf-1766-41db-a6b3-0ee5eff72bd7}"
            ],
            "value_type": "REG_MULTI_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "16000048",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\16000048",
    "timestamp": "2016-12-26T06:45:05.510264+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": 1,
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "16000060",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\16000060",
    "timestamp": "2014-09-19T01:36:18.318576+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": 1,
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "21000001",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\21000001",
    "timestamp": "2014-09-19T01:36:18.318576+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "c8dc1976fefad911b411000476eba25f0000000001000000a0000000000000000300000000000000000000000000000000000000000000000100000078000000",
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "22000002",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\22000002",
    "timestamp": "2014-09-19T01:36:18.318576+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "\\windows",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "250000c2",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\250000c2",
    "timestamp": "2014-09-19T01:36:18.318576+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "0100000000000000",
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "26000010",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\26000010",
    "timestamp": "2014-09-19T01:36:18.318576+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": 1,
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "26000022",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\26000022",
    "timestamp": "2014-09-19T01:36:18.318576+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": 1,
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "260000b0",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements\\260000b0",
    "timestamp": "2014-09-19T01:36:18.318576+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": 0,
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "Elements",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}\\Elements",
    "timestamp": "2016-12-26T06:45:05.510264+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "{7619dcc9-fafe-11d9-b411-000476eba25f}",
    "path": "\\Objects\\{7619dcc9-fafe-11d9-b411-000476eba25f}",
    "timestamp": "2016-12-26T06:45:04.208030+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "Description",
    "path": "\\Objects\\{7ea2e1ac-2e61-4728-aaa3-896d9d0a9f0e}\\Description",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Type",
            "value": 537919488,
            "value_type": "REG_DWORD",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "14000006",
    "path": "\\Objects\\{7ea2e1ac-2e61-4728-aaa3-896d9d0a9f0e}\\Elements\\14000006",
    "timestamp": "2014-09-19T01:31:17.403884+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": [
                "{4636856e-540f-4170-a130-a84776f4c654}",
                "{0ce4991b-e6b3-4b16-b23c-5e0d9250e5d9}"
            ],
            "value_type": "REG_MULTI_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "Elements",
    "path": "\\Objects\\{7ea2e1ac-2e61-4728-aaa3-896d9d0a9f0e}\\Elements",
    "timestamp": "2014-09-19T01:31:17.403884+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "{7ea2e1ac-2e61-4728-aaa3-896d9d0a9f0e}",
    "path": "\\Objects\\{7ea2e1ac-2e61-4728-aaa3-896d9d0a9f0e}",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "Description",
    "path": "\\Objects\\{7ff607e0-4395-11db-b0de-0800200c9a66}\\Description",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Type",
            "value": 538968067,
            "value_type": "REG_DWORD",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "12000004",
    "path": "\\Objects\\{7ff607e0-4395-11db-b0de-0800200c9a66}\\Elements\\12000004",
    "timestamp": "2014-09-19T01:31:17.403884+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "Hypervisor Settings",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "250000f3",
    "path": "\\Objects\\{7ff607e0-4395-11db-b0de-0800200c9a66}\\Elements\\250000f3",
    "timestamp": "2014-09-19T01:31:17.403884+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "0000000000000000",
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "250000f4",
    "path": "\\Objects\\{7ff607e0-4395-11db-b0de-0800200c9a66}\\Elements\\250000f4",
    "timestamp": "2014-09-19T01:31:17.403884+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "0100000000000000",
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "250000f5",
    "path": "\\Objects\\{7ff607e0-4395-11db-b0de-0800200c9a66}\\Elements\\250000f5",
    "timestamp": "2014-09-19T01:31:17.403884+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "00c2010000000000",
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "Elements",
    "path": "\\Objects\\{7ff607e0-4395-11db-b0de-0800200c9a66}\\Elements",
    "timestamp": "2014-09-19T01:31:17.403884+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "{7ff607e0-4395-11db-b0de-0800200c9a66}",
    "path": "\\Objects\\{7ff607e0-4395-11db-b0de-0800200c9a66}",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "Description",
    "path": "\\Objects\\{9dea862c-5cdd-4e70-acc1-f32b344d4795}\\Description",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Type",
            "value": 269484034,
            "value_type": "REG_DWORD",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "12000004",
    "path": "\\Objects\\{9dea862c-5cdd-4e70-acc1-f32b344d4795}\\Elements\\12000004",
    "timestamp": "2014-09-19T01:36:18.302954+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "Windows Boot Manager",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "12000005",
    "path": "\\Objects\\{9dea862c-5cdd-4e70-acc1-f32b344d4795}\\Elements\\12000005",
    "timestamp": "2014-09-19T01:36:18.302954+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "en-US",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "12000030",
    "path": "\\Objects\\{9dea862c-5cdd-4e70-acc1-f32b344d4795}\\Elements\\12000030",
    "timestamp": "2016-12-26T06:44:44.895738+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "DISABLE_INTEGRITY_CHECKS",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "14000006",
    "path": "\\Objects\\{9dea862c-5cdd-4e70-acc1-f32b344d4795}\\Elements\\14000006",
    "timestamp": "2014-09-19T01:36:18.302954+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": [
                "{7ea2e1ac-2e61-4728-aaa3-896d9d0a9f0e}"
            ],
            "value_type": "REG_MULTI_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "16000048",
    "path": "\\Objects\\{9dea862c-5cdd-4e70-acc1-f32b344d4795}\\Elements\\16000048",
    "timestamp": "2016-12-26T06:44:52.598586+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": 1,
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "23000003",
    "path": "\\Objects\\{9dea862c-5cdd-4e70-acc1-f32b344d4795}\\Elements\\23000003",
    "timestamp": "2014-09-19T01:36:35.579816+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "{7619dcc9-fafe-11d9-b411-000476eba25f}",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "24000001",
    "path": "\\Objects\\{9dea862c-5cdd-4e70-acc1-f32b344d4795}\\Elements\\24000001",
    "timestamp": "2014-09-19T01:36:18.302954+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": [
                "{7619dcc9-fafe-11d9-b411-000476eba25f}"
            ],
            "value_type": "REG_MULTI_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "24000010",
    "path": "\\Objects\\{9dea862c-5cdd-4e70-acc1-f32b344d4795}\\Elements\\24000010",
    "timestamp": "2014-09-19T01:36:18.302954+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": [
                "{b2721d73-1db4-4c62-bf78-c548a880142d}"
            ],
            "value_type": "REG_MULTI_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "25000004",
    "path": "\\Objects\\{9dea862c-5cdd-4e70-acc1-f32b344d4795}\\Elements\\25000004",
    "timestamp": "2014-09-19T01:36:18.302954+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": 30,
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "Elements",
    "path": "\\Objects\\{9dea862c-5cdd-4e70-acc1-f32b344d4795}\\Elements",
    "timestamp": "2016-12-26T06:44:52.598586+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "{9dea862c-5cdd-4e70-acc1-f32b344d4795}",
    "path": "\\Objects\\{9dea862c-5cdd-4e70-acc1-f32b344d4795}",
    "timestamp": "2016-12-26T06:44:51.495686+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "Description",
    "path": "\\Objects\\{b2721d73-1db4-4c62-bf78-c548a880142d}\\Description",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Type",
            "value": 270532613,
            "value_type": "REG_DWORD",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "11000001",
    "path": "\\Objects\\{b2721d73-1db4-4c62-bf78-c548a880142d}\\Elements\\11000001",
    "timestamp": "2014-09-19T01:31:17.388258+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "00000000000000000000000000000000050000000000000048000000000000000000000000000000000000000000000000000000000000000000000000000000",
            "value_type": "REG_BINARY",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "12000002",
    "path": "\\Objects\\{b2721d73-1db4-4c62-bf78-c548a880142d}\\Elements\\12000002",
    "timestamp": "2014-09-19T01:31:17.388258+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "\\efi\\microsoft\\boot\\memtest.efi",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "12000004",
    "path": "\\Objects\\{b2721d73-1db4-4c62-bf78-c548a880142d}\\Elements\\12000004",
    "timestamp": "2014-09-19T01:31:17.388258+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "Windows Memory Diagnostic",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "12000005",
    "path": "\\Objects\\{b2721d73-1db4-4c62-bf78-c548a880142d}\\Elements\\12000005",
    "timestamp": "2014-09-19T01:31:17.388258+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": "en-US",
            "value_type": "REG_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "14000006",
    "path": "\\Objects\\{b2721d73-1db4-4c62-bf78-c548a880142d}\\Elements\\14000006",
    "timestamp": "2014-09-19T01:31:17.388258+00:00",
    "values_count": 1,
    "values": [
        {
            "name": "Element",
            "value": [
                "{7ea2e1ac-2e61-4728-aaa3-896d9d0a9f0e}"
            ],
            "value_type": "REG_MULTI_SZ",
            "is_corrupted": false
        }
    ],
    "actual_path": null
}
{
    "subkey_name": "Elements",
    "path": "\\Objects\\{b2721d73-1db4-4c62-bf78-c548a880142d}\\Elements",
    "timestamp": "2014-09-19T01:31:17.388258+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "{b2721d73-1db4-4c62-bf78-c548a880142d}",
    "path": "\\Objects\\{b2721d73-1db4-4c62-bf78-c548a880142d}",
    "timestamp": "2014-09-19T01:36:18.287326+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "Objects",
    "path": "\\Objects",
    "timestamp": "2016-12-26T06:45:04.208030+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
{
    "subkey_name": "System",
    "path": "\\",
    "timestamp": "2016-12-26T06:45:04.208030+00:00",
    "values_count": 0,
    "values": [],
    "actual_path": null
}
```
