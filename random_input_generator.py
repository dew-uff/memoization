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
        "num_inputs",
        type=int,
        help="Number of inputs to generate."
    )

    parser.add_argument(
        "type",
        choices=["int", "float"],
        help="Type of value to generate."
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

    args = parser.parse_args()

    if args.lower > args.upper:
        sys.exit("Error: lower must be <= upper.")

    seed = args.seed if args.seed is not None else secrets.randbits(64)

    rng = random.Random(seed)

    if args.type == "int":
        lower = int(args.lower)
        upper = int(args.upper)
        inputs = [rng.randint(lower, upper) for _ in range(args.num_inputs)]
    else:
        inputs = [rng.uniform(args.lower, args.upper) for _ in range(args.num_inputs)]

    results = {"seed": seed, "inputs": inputs}
    print(json.dumps(results))


if __name__ == "__main__":
    main()
