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

    args = parser.parse_args()

    seed = args.seed if args.seed is not None else secrets.randbits(64)

    rng = random.Random(seed)

    base = list(range(args.num_inputs))

    if args.num_inputs <= 2:
        raise ValueError("num_inputs must be > 2 to avoid identity and reverse permutations")

    while True:
        inputs = base[:]
        rng.shuffle(inputs)

        if inputs != base and inputs != base[::-1]:
            break

    results = {"seed": seed, "inputs": inputs}
    print(json.dumps(results))


if __name__ == "__main__":
    main()
