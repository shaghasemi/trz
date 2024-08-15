# Test Project


### Flutter SDK Version: `3.22.2`
### Dart Version: `3.4.3`
### DevTools Version: `2.34.3`
<hr>


## Step for Running Application
1-Import project from github

2-In project root, open a terminal and run:
``` bash
flutter pub get
```
``` bash
flutter gen-l10n
```
if you have error, run:
``` bash
dart run build_runner build
```

3-Run app by your IDE in Emulator.
<hr>


### Splash Screen
```mermaid
flowchart TD
    A("Transactions Screen") --> B{"Add Transaction"}
    A("Transactions Screen") --> C{"Data Manipulation"}
    A("Transactions Screen") --> D{"Settings"}
    A("Transactions Screen") --> E{"Item Long Press"}

    B("Floating Action Buttton") --> BB{"Long Press"}
    BB -- Yes --> BC("Add Transaction - New Page")
    BB -- No --> BD("Add Transaction - Modal Bottom")

    C("PopUp Button") --> CB{"Press"}
    CB -- Add 1000 --> CC("Add 1000 Random Transactions")
    CB -- Delete All --> CD("Delete All Records")

    D("Settings Buttton") --> DB{"Press"}
    DB -- Yes --> J1("Navigates to Settings Page")

    E("Item Press") --> EB{"Long Press"}
    EB -- Yes --> EC("Open Context Menu")
    EB -- No --> ED("View Transaction Info")

    linkStyle 1 stroke:#00C853,fill:none
    linkStyle 2 stroke:#D50000,fill:none
    linkStyle 3 stroke:#00C853,fill:none
    linkStyle 4 stroke:#D50000,fill:none
```
