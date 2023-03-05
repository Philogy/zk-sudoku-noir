global N: Field = 9;
global Nh: Field = 3;

fn check_row(solution_row : [u4; N], puzzle_row : [u4; N]) {
  for i in 0..N {
    let solEl: u4 = solution_row[i];
    let puzEl: u4 = puzzle_row[i];
    constrain solEl <= (N as u4);
    constrain  solEl > 0;
    constrain ((solEl == puzEl) | (puzEl == 0));
  };
}

fn check_no_duplicates(solution_group : [u4; N]) {
  for i in 0..N {
    for j in (i + 1)..N {
      constrain solution_group[i] != solution_group[j];
    }
  }
}

fn check_no_duplicates_in_block_row(sol_row1 : [u4; N], sol_row2 : [u4; N], sol_row3 : [u4; N]) {
  for i in 0..Nh {
    let block: [u4; N] = [
      sol_row1[i * 3 + 0],
      sol_row1[i * 3 + 1],
      sol_row1[i * 3 + 2],
      sol_row2[i * 3 + 0],
      sol_row2[i * 3 + 1],
      sol_row2[i * 3 + 2],
      sol_row3[i * 3 + 0],
      sol_row3[i * 3 + 1],
      sol_row3[i * 3 + 2]
    ];
    check_no_duplicates(block);
  }
}


fn main(
  solution_row1 : [u4; N],
  solution_row2 : [u4; N],
  solution_row3 : [u4; N],
  solution_row4 : [u4; N],
  solution_row5 : [u4; N],
  solution_row6 : [u4; N],
  solution_row7 : [u4; N],
  solution_row8 : [u4; N],
  solution_row9 : [u4; N],
  puzzle_row1   : pub [u4; N],
  puzzle_row2   : pub [u4; N],
  puzzle_row3   : pub [u4; N],
  puzzle_row4   : pub [u4; N],
  puzzle_row5   : pub [u4; N],
  puzzle_row6   : pub [u4; N],
  puzzle_row7   : pub [u4; N],
  puzzle_row8   : pub [u4; N],
  puzzle_row9   : pub [u4; N],
) {
  // Check that the solution is actually for the given puzzle
  check_row(solution_row1, puzzle_row1);
  check_row(solution_row2, puzzle_row2);
  check_row(solution_row3, puzzle_row3);
  check_row(solution_row4, puzzle_row4);
  check_row(solution_row5, puzzle_row5);
  check_row(solution_row6, puzzle_row6);
  check_row(solution_row7, puzzle_row7);
  check_row(solution_row8, puzzle_row8);
  check_row(solution_row9, puzzle_row9);

  // Check rows
  check_no_duplicates(solution_row1);
  check_no_duplicates(solution_row2);
  check_no_duplicates(solution_row3);
  check_no_duplicates(solution_row4);
  check_no_duplicates(solution_row5);
  check_no_duplicates(solution_row6);
  check_no_duplicates(solution_row7);
  check_no_duplicates(solution_row8);
  check_no_duplicates(solution_row9);

  // Check columns
  for col in 0..N {
    let column: [u4; N] = [
      solution_row1[col],
      solution_row2[col],
      solution_row3[col],
      solution_row4[col],
      solution_row5[col],
      solution_row6[col],
      solution_row7[col],
      solution_row8[col],
      solution_row9[col],
    ];
    check_no_duplicates(column);
  }

  // Check blocks
  check_no_duplicates_in_block_row(solution_row1, solution_row2, solution_row3);
  check_no_duplicates_in_block_row(solution_row4, solution_row5, solution_row6);
  check_no_duplicates_in_block_row(solution_row7, solution_row8, solution_row9);
}
