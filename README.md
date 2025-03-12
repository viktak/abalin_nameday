![GitHub](https://img.shields.io/github/license/viktak/abalin_nameday) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/viktak/abalin_nameday) ![PyPI](https://img.shields.io/pypi/v/abalin_nameday) ![PyPI - Python Version](https://img.shields.io/pypi/pyversions/abalin_nameday) ![PyPI - Format](https://img.shields.io/pypi/format/abalin_nameday)

# abalin_nameday
Simple Python wrapper for the International NameDay API @ https://nameday.abalin.net/

## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install `abalin_nameday`.

```bash
pip install abalin_nameday
```

## Usage

```python
import abalin_nameday
myClient = abalin_nameday.namedayRequestor(country, timezone)
print(json.dumps(json.loads(myClient.GetData()), indent=2, sort_keys=True))
```

### Explanation
`country`: one of the countries from this list:
```python
['cz','sk','pl','fr','hu','hr','se','us','at','it','es','de','dk','fi','bg','lt','ee','lv','gr','ru']
```

`timezone`: One of the time zones from this list:<br>

```python
'America/Denver',
'America/Costa_Rica',
'America/Los_Angeles',
'America/St_Vincent',
'America/Toronto',
'Europe/Amsterdam',
'Europe/Monaco',
'Europe/Prague',
'Europe/Isle_of_Man',
'Africa/Cairo',
'Africa/Johannesburg',
'Africa/Nairobi',
'Asia/Yakutsk',
'Asia/Hong_Kong',
'Asia/Taipei',
'Pacific/Midway',
'Pacific/Honolulu',
'Etc/GMT-6',
'US/Samoa',
'Zulu',
'US/Hawaii',
'Israel',
'Etc/GMT-2',
```

If the call is successful, `abalin_nameday` returns a string that contains today's date and name day in the selected country. It also contains version information about itself.

See the [documentation of the actual API](https://app.swaggerhub.com/apis/nekvapil/InternationalNamedayAPI/3.0.0) for up to date list of countries/time zones supported.

Sample response from `owm2json`:
```json
{
  "module": {
    "version": "0.0.1"
  },
  "namedays": {
    "data": {
      "dates": {
        "day": 5,
        "month": 4
      },
      "namedays": {
        "hu": "Vince"
      }
    }
  }
}
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[GNU General Public License v3.0](https://choosealicense.com/licenses/gpl-3.0/)
