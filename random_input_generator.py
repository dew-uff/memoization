#!/usr/bin/env python3

import argparse
import random
import secrets
import sys
import json


def main():
    parser = argparse.ArgumentParser(
        description="Generate a reproducible random integer or float."
    )

    parser.add_argument(
        "--seed",
        type=int,
        help="Random seed (optional). If omitted, a random seed is generated."
    )

    parser.add_argument(
        "lower",
        type=float,
        help="Lower limit (inclusive)."
    )

    parser.add_argument(
        "upper",
        type=float,
        help="Upper limit (inclusive for integers)."
    )

    parser.add_argument(
        "type",
        choices=["int", "float"],
        help="Type of value to generate."
    )

    args = parser.parse_args()

    if args.lower > args.upper:
        sys.exit("Error: lower must be <= upper.")

    seed = args.seed if args.seed is not None else secrets.randbits(64)

    rng = random.Random(seed)

    if args.type == "int":
        lower = int(args.lower)
        upper = int(args.upper)
        value = rng.randint(lower, upper)
    else:
        value = rng.uniform(args.lower, args.upper)

    print(json.dumps({"seed": seed, "value": value}))


if __name__ == "__main__":
    main()
