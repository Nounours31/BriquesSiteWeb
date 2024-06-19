def fib(file):    # write Fibonacci series up to n
    with open(file, 'r') as file:
    data = file.read().replace('\n', '')
    print()


if __name__ == "__main__":
    import sys
    import argparse

    parser = argparse.ArgumentParser(description='Parse mySQL init.')
    parser.add_argument('--sum', dest='accumulate', action='store_const', const=sum, default=max, help='sum the integers (default: find the max)')

    args = parser.parse_args()
    print(args.accumulate(args.integers))
    
    fib(int(sys.argv[1]))