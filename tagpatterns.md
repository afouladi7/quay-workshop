# Tag Patterns

| Pattern  | Description  |
|---|---|
| *  | Matches all characters  |
| ?  | Matches any single character |
| [seq]  | Matches any character in *seq* |
| [!seq] | Matches any character not in *seq* |

## Examples
| Example Pattern  | Example Matches  |
|---|---|
| v3*  |  v32, v3.1, v3.2, v3.2-4beta, v3.3 |
| v3.*  |  v3.1, v3.2, v3.2-4beta |
| v3.?  |  v3.1, v3.2, v3.3 |
| v3.[12]  |  v3.1, v3.2 |
| v3.[12]*  |  v3.1, v3.2, v3.2-4beta |
| v3.[!1]*  |  v3.2, v3.2-4beta, v3.3 |