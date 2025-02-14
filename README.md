# Utils

A collection of useful scripts for automating various tasks related to API authentication, data retrieval, and more. Each script is designed to be modular and easy to use.

## Table of Contents
- [Scripts](#scripts)
  - [get_token.sh](#get_tokensh)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

---

## Scripts

### get_token.sh
**Description:**
This script retrieves an OAuth2 token using the client credentials grant type. It caches the token and automatically refreshes it when it expires.

**Usage:**
```sh
curl -H "Authorization: Bearer $(./get_token.sh CLIENT_ID CLIENT_SECRET TOKEN_URL)" https://api.example.com/data
```

**Example:**
```sh
curl -H "Authorization: Bearer $(./get_token.sh my-client-id my-client-secret https://auth.example.com/token)" https://api.example.com/data
```

**Output:**
A valid OAuth2 token will be obtained and used directly within the `curl` command.

**Implementation Details:**
- Uses `curl` to request a token.
- Extracts and caches the token for reuse.
- Automatically refreshes the token when expired.
- Can be called inline within API requests to avoid manual token handling.

---

## Usage
Each script can be executed independently. See the documentation for each script for specific instructions.

---

## Contributing
Contributions are welcome! If you have useful scripts to add, please open a pull request.

---

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

