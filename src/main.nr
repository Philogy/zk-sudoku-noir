global N2: Field = 81;
global N: Field = 9;
global Nh: Field = 3;

fn ensure_solution_for_puzzle(
  solution:  [u4; N2],
  puzzle  :  [u4; N2]
) {
  for i in 0..N2 {
    let solEl: u4 = solution[i];
    constrain solEl > 0;
    constrain solEl <= 9;
    let puzEl: u4 = puzzle[i];
    constrain (solEl == puzEl) | (puzEl == 0);
  }
}

fn check_solution_lines(solution: [u4; N2]) {
  for i in 0..N {
    for a in 0..N {
      for b in (a+1)..N {
        // Check row element
        constrain solution[i * 9 + a] != solution[i * 9 + b];
        // Check column Element
        constrain solution[i + 9 * a] != solution[i + 9 * b];
      }
    }
  }
}

fn check_solution_blocks(solution: [u4; N2]) {
  let block_offsets: [comptime Field; N] = [0, 1, 2, 9, 10, 11, 18, 19, 20];
  for x in 0..Nh {
    for y in 0..Nh {
      let baseInd: comptime Field = x * 27 + y * 3;
      for i in 0..N {
        for j in (i+1)..N {
          constrain solution[baseInd + block_offsets[i]] != solution[baseInd + block_offsets[j]];
        }
      }
    }
  }
}

fn main(
  solution:  [u4; N2],
  puzzle: pub [u4; N2]
) {
  ensure_solution_for_puzzle(solution, puzzle);

  check_solution_lines(solution);
}
