offsets = (0, 1, 2, 9, 10, 11, 18, 19, 20)


def main():
    cs = []
    for x in range(3):
        for y in range(3):
            base_ind = 27 * x + 3 * y
            cs.append((x, y, []))
            for a in range(9):
                for b in range(a + 1, 9):
                    cs[-1][2].append(
                        (base_ind + offsets[a], base_ind + offsets[b])
                    )
    for x, y, block_constraints in cs:
        print(f'\n  // block({x + 1}, {y + 1})')
        for i, j in block_constraints:
            print(f'  constrain solution[{i}] != solution[{j}];')


if __name__ == '__main__':
    main()
