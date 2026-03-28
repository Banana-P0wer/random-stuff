# random CLI

CLI utility for generating random values: numbers, strings, passwords, UUIDs, dates, colors and other data. It can generate:
- numbers
- strings
- passwords
- uuid
- hex
- dates
- colors
- picks from a list
- shuffles
- dice rolls

A handy tool for developers, testing, scripts and everyday tasks.

## number

**What it does:**
Generates a random number.

**What it is for:**
When you need a random number in a given range.

**Examples:**

```bash
swift main.swift number
```

Random number (for example 0-100)

```bash
swift main.swift number --min 10 --max 50
```

Random number from 10 to 50.


## string

**What it does:**
Generates a random string.

**What it is for:**
Tokens, test data, temporary keys.

**Examples:**

```bash
swift main.swift string --length 10
```

**Result:**

```bash
aF82kLpQ1x
```

You can add a character type:

```bash
swift main.swift string --length 10 --charset alnum
```

## coin

**What it does:**
Flips a virtual coin.

**Example:**

```bash
swift main.swift coin
```

**Result:**

`heads` / `tails`


## dice

**What it does:**
Rolls a die.

**Examples:**

```bash
swift main.swift dice
```

Number 1-6.

```bash
swift main.swift dice --sides 20
```

A d20 die (1-20) is used in tabletop games.



## uuid

**What it does:**
Generates a UUID (unique identifier).

**Example:**

```bash
swift main.swift uuid
```

**Result:**

```text
550e8400-e29b-41d4-a716-446655440000
```

**What it is for:**

- ids in databases
- object ids
- file ids
- id API



## hex

**What it does:**
Generates a random string in hexadecimal format.

**Example:**

```bash
swift main.swift hex --bytes 16
```

**Result:**

```text
9f2a7c4d1e8b3a6f4d9c1e2a3b7f0c8d
```

**What it is for:**

- keys
- tokens
- cryptography
- hashes



## password

**What it does:**
Generates a random password.

**Example:**

```bash
swift main.swift password --length 16
```

**Result:**

```text
gT7!qL2#Zp9@rA4$
```

Usually contains:

- letters
- digits
- special characters



## pick

**What it does:**
Picks a random item from a list.

**Example:**

```bash
swift main.swift pick apple banana orange
```

**Result:**

```text
banana
```

**What it is for:**

- random choices
- tests
- making decisions



## shuffle

**What it does:**
Shuffles a list.

**Example:**

```bash
swift main.swift shuffle a b c d
```

**Result:**

```text
c a d b
```

**What it is for:**

- shuffling data
- cards
- random orders



## list

**What it does:**
Generates a list of random numbers or items.

**Example:**

```bash
swift main.swift list --count 5 --min 1 --max 10
```

**Result:**

```text
3, 7, 1, 9, 4
```



## date

**What it does:**
Generates a random date.

**Example:**

```bash
swift main.swift date --from 2000 --to 2024
```

**Result:**

```text
2013-07-19
```

**What it is for:**

- test data
- databases
- simulations



## color

**What it does:**
Generates a random color.

**Example:**

```bash
swift main.swift color
```

**Result:**

```text
#3FA7D6
```

or

```text
rgb(63,167,214)
```

**What it is for:**

- design
- UI tests
- generating themes



## seed

**What it does:**
Sets the starting value of the random number generator.

This is needed when you want the random result to be repeatable.

**Example:**

```bash
swift main.swift number --seed 42
```

Every run gives the same result.

**What it is for:**

- testing
- reproducibility
- simulations
