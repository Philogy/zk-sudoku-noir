offsets = (0, 1, 2, 9, 10, 11, 18, 19, 20)


def main():
    cs = []
    for x in range(3):
        for y in range(3):
            base_ind = 27 * x + 3 * y
            for a in range(9):
                for b in range(a + 1, 9):
                    cs.append((base_ind + offsets[a], base_ind + offsets[b]))
    for i, j in cs:
        print(f'constrain solution[{i}] == solution[{j}];')


if __name__ == '__main__':
    main()
