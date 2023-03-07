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
  // block(1, 1)
  constrain solution[0] != solution[1];
  constrain solution[0] != solution[2];
  constrain solution[0] != solution[9];
  constrain solution[0] != solution[10];
  constrain solution[0] != solution[11];
  constrain solution[0] != solution[18];
  constrain solution[0] != solution[19];
  constrain solution[0] != solution[20];
  constrain solution[1] != solution[2];
  constrain solution[1] != solution[9];
  constrain solution[1] != solution[10];
  constrain solution[1] != solution[11];
  constrain solution[1] != solution[18];
  constrain solution[1] != solution[19];
  constrain solution[1] != solution[20];
  constrain solution[2] != solution[9];
  constrain solution[2] != solution[10];
  constrain solution[2] != solution[11];
  constrain solution[2] != solution[18];
  constrain solution[2] != solution[19];
  constrain solution[2] != solution[20];
  constrain solution[9] != solution[10];
  constrain solution[9] != solution[11];
  constrain solution[9] != solution[18];
  constrain solution[9] != solution[19];
  constrain solution[9] != solution[20];
  constrain solution[10] != solution[11];
  constrain solution[10] != solution[18];
  constrain solution[10] != solution[19];
  constrain solution[10] != solution[20];
  constrain solution[11] != solution[18];
  constrain solution[11] != solution[19];
  constrain solution[11] != solution[20];
  constrain solution[18] != solution[19];
  constrain solution[18] != solution[20];
  constrain solution[19] != solution[20];

  // block(1, 2)
  constrain solution[3] != solution[4];
  constrain solution[3] != solution[5];
  constrain solution[3] != solution[12];
  constrain solution[3] != solution[13];
  constrain solution[3] != solution[14];
  constrain solution[3] != solution[21];
  constrain solution[3] != solution[22];
  constrain solution[3] != solution[23];
  constrain solution[4] != solution[5];
  constrain solution[4] != solution[12];
  constrain solution[4] != solution[13];
  constrain solution[4] != solution[14];
  constrain solution[4] != solution[21];
  constrain solution[4] != solution[22];
  constrain solution[4] != solution[23];
  constrain solution[5] != solution[12];
  constrain solution[5] != solution[13];
  constrain solution[5] != solution[14];
  constrain solution[5] != solution[21];
  constrain solution[5] != solution[22];
  constrain solution[5] != solution[23];
  constrain solution[12] != solution[13];
  constrain solution[12] != solution[14];
  constrain solution[12] != solution[21];
  constrain solution[12] != solution[22];
  constrain solution[12] != solution[23];
  constrain solution[13] != solution[14];
  constrain solution[13] != solution[21];
  constrain solution[13] != solution[22];
  constrain solution[13] != solution[23];
  constrain solution[14] != solution[21];
  constrain solution[14] != solution[22];
  constrain solution[14] != solution[23];
  constrain solution[21] != solution[22];
  constrain solution[21] != solution[23];
  constrain solution[22] != solution[23];

  // block(1, 3)
  constrain solution[6] != solution[7];
  constrain solution[6] != solution[8];
  constrain solution[6] != solution[15];
  constrain solution[6] != solution[16];
  constrain solution[6] != solution[17];
  constrain solution[6] != solution[24];
  constrain solution[6] != solution[25];
  constrain solution[6] != solution[26];
  constrain solution[7] != solution[8];
  constrain solution[7] != solution[15];
  constrain solution[7] != solution[16];
  constrain solution[7] != solution[17];
  constrain solution[7] != solution[24];
  constrain solution[7] != solution[25];
  constrain solution[7] != solution[26];
  constrain solution[8] != solution[15];
  constrain solution[8] != solution[16];
  constrain solution[8] != solution[17];
  constrain solution[8] != solution[24];
  constrain solution[8] != solution[25];
  constrain solution[8] != solution[26];
  constrain solution[15] != solution[16];
  constrain solution[15] != solution[17];
  constrain solution[15] != solution[24];
  constrain solution[15] != solution[25];
  constrain solution[15] != solution[26];
  constrain solution[16] != solution[17];
  constrain solution[16] != solution[24];
  constrain solution[16] != solution[25];
  constrain solution[16] != solution[26];
  constrain solution[17] != solution[24];
  constrain solution[17] != solution[25];
  constrain solution[17] != solution[26];
  constrain solution[24] != solution[25];
  constrain solution[24] != solution[26];
  constrain solution[25] != solution[26];

  // block(2, 1)
  constrain solution[27] != solution[28];
  constrain solution[27] != solution[29];
  constrain solution[27] != solution[36];
  constrain solution[27] != solution[37];
  constrain solution[27] != solution[38];
  constrain solution[27] != solution[45];
  constrain solution[27] != solution[46];
  constrain solution[27] != solution[47];
  constrain solution[28] != solution[29];
  constrain solution[28] != solution[36];
  constrain solution[28] != solution[37];
  constrain solution[28] != solution[38];
  constrain solution[28] != solution[45];
  constrain solution[28] != solution[46];
  constrain solution[28] != solution[47];
  constrain solution[29] != solution[36];
  constrain solution[29] != solution[37];
  constrain solution[29] != solution[38];
  constrain solution[29] != solution[45];
  constrain solution[29] != solution[46];
  constrain solution[29] != solution[47];
  constrain solution[36] != solution[37];
  constrain solution[36] != solution[38];
  constrain solution[36] != solution[45];
  constrain solution[36] != solution[46];
  constrain solution[36] != solution[47];
  constrain solution[37] != solution[38];
  constrain solution[37] != solution[45];
  constrain solution[37] != solution[46];
  constrain solution[37] != solution[47];
  constrain solution[38] != solution[45];
  constrain solution[38] != solution[46];
  constrain solution[38] != solution[47];
  constrain solution[45] != solution[46];
  constrain solution[45] != solution[47];
  constrain solution[46] != solution[47];

  // block(2, 2)
  constrain solution[30] != solution[31];
  constrain solution[30] != solution[32];
  constrain solution[30] != solution[39];
  constrain solution[30] != solution[40];
  constrain solution[30] != solution[41];
  constrain solution[30] != solution[48];
  constrain solution[30] != solution[49];
  constrain solution[30] != solution[50];
  constrain solution[31] != solution[32];
  constrain solution[31] != solution[39];
  constrain solution[31] != solution[40];
  constrain solution[31] != solution[41];
  constrain solution[31] != solution[48];
  constrain solution[31] != solution[49];
  constrain solution[31] != solution[50];
  constrain solution[32] != solution[39];
  constrain solution[32] != solution[40];
  constrain solution[32] != solution[41];
  constrain solution[32] != solution[48];
  constrain solution[32] != solution[49];
  constrain solution[32] != solution[50];
  constrain solution[39] != solution[40];
  constrain solution[39] != solution[41];
  constrain solution[39] != solution[48];
  constrain solution[39] != solution[49];
  constrain solution[39] != solution[50];
  constrain solution[40] != solution[41];
  constrain solution[40] != solution[48];
  constrain solution[40] != solution[49];
  constrain solution[40] != solution[50];
  constrain solution[41] != solution[48];
  constrain solution[41] != solution[49];
  constrain solution[41] != solution[50];
  constrain solution[48] != solution[49];
  constrain solution[48] != solution[50];
  constrain solution[49] != solution[50];

  // block(2, 3)
  constrain solution[33] != solution[34];
  constrain solution[33] != solution[35];
  constrain solution[33] != solution[42];
  constrain solution[33] != solution[43];
  constrain solution[33] != solution[44];
  constrain solution[33] != solution[51];
  constrain solution[33] != solution[52];
  constrain solution[33] != solution[53];
  constrain solution[34] != solution[35];
  constrain solution[34] != solution[42];
  constrain solution[34] != solution[43];
  constrain solution[34] != solution[44];
  constrain solution[34] != solution[51];
  constrain solution[34] != solution[52];
  constrain solution[34] != solution[53];
  constrain solution[35] != solution[42];
  constrain solution[35] != solution[43];
  constrain solution[35] != solution[44];
  constrain solution[35] != solution[51];
  constrain solution[35] != solution[52];
  constrain solution[35] != solution[53];
  constrain solution[42] != solution[43];
  constrain solution[42] != solution[44];
  constrain solution[42] != solution[51];
  constrain solution[42] != solution[52];
  constrain solution[42] != solution[53];
  constrain solution[43] != solution[44];
  constrain solution[43] != solution[51];
  constrain solution[43] != solution[52];
  constrain solution[43] != solution[53];
  constrain solution[44] != solution[51];
  constrain solution[44] != solution[52];
  constrain solution[44] != solution[53];
  constrain solution[51] != solution[52];
  constrain solution[51] != solution[53];
  constrain solution[52] != solution[53];

  // block(3, 1)
  constrain solution[54] != solution[55];
  constrain solution[54] != solution[56];
  constrain solution[54] != solution[63];
  constrain solution[54] != solution[64];
  constrain solution[54] != solution[65];
  constrain solution[54] != solution[72];
  constrain solution[54] != solution[73];
  constrain solution[54] != solution[74];
  constrain solution[55] != solution[56];
  constrain solution[55] != solution[63];
  constrain solution[55] != solution[64];
  constrain solution[55] != solution[65];
  constrain solution[55] != solution[72];
  constrain solution[55] != solution[73];
  constrain solution[55] != solution[74];
  constrain solution[56] != solution[63];
  constrain solution[56] != solution[64];
  constrain solution[56] != solution[65];
  constrain solution[56] != solution[72];
  constrain solution[56] != solution[73];
  constrain solution[56] != solution[74];
  constrain solution[63] != solution[64];
  constrain solution[63] != solution[65];
  constrain solution[63] != solution[72];
  constrain solution[63] != solution[73];
  constrain solution[63] != solution[74];
  constrain solution[64] != solution[65];
  constrain solution[64] != solution[72];
  constrain solution[64] != solution[73];
  constrain solution[64] != solution[74];
  constrain solution[65] != solution[72];
  constrain solution[65] != solution[73];
  constrain solution[65] != solution[74];
  constrain solution[72] != solution[73];
  constrain solution[72] != solution[74];
  constrain solution[73] != solution[74];

  // block(3, 2)
  constrain solution[57] != solution[58];
  constrain solution[57] != solution[59];
  constrain solution[57] != solution[66];
  constrain solution[57] != solution[67];
  constrain solution[57] != solution[68];
  constrain solution[57] != solution[75];
  constrain solution[57] != solution[76];
  constrain solution[57] != solution[77];
  constrain solution[58] != solution[59];
  constrain solution[58] != solution[66];
  constrain solution[58] != solution[67];
  constrain solution[58] != solution[68];
  constrain solution[58] != solution[75];
  constrain solution[58] != solution[76];
  constrain solution[58] != solution[77];
  constrain solution[59] != solution[66];
  constrain solution[59] != solution[67];
  constrain solution[59] != solution[68];
  constrain solution[59] != solution[75];
  constrain solution[59] != solution[76];
  constrain solution[59] != solution[77];
  constrain solution[66] != solution[67];
  constrain solution[66] != solution[68];
  constrain solution[66] != solution[75];
  constrain solution[66] != solution[76];
  constrain solution[66] != solution[77];
  constrain solution[67] != solution[68];
  constrain solution[67] != solution[75];
  constrain solution[67] != solution[76];
  constrain solution[67] != solution[77];
  constrain solution[68] != solution[75];
  constrain solution[68] != solution[76];
  constrain solution[68] != solution[77];
  constrain solution[75] != solution[76];
  constrain solution[75] != solution[77];
  constrain solution[76] != solution[77];

  // block(3, 3)
  constrain solution[60] != solution[61];
  constrain solution[60] != solution[62];
  constrain solution[60] != solution[69];
  constrain solution[60] != solution[70];
  constrain solution[60] != solution[71];
  constrain solution[60] != solution[78];
  constrain solution[60] != solution[79];
  constrain solution[60] != solution[80];
  constrain solution[61] != solution[62];
  constrain solution[61] != solution[69];
  constrain solution[61] != solution[70];
  constrain solution[61] != solution[71];
  constrain solution[61] != solution[78];
  constrain solution[61] != solution[79];
  constrain solution[61] != solution[80];
  constrain solution[62] != solution[69];
  constrain solution[62] != solution[70];
  constrain solution[62] != solution[71];
  constrain solution[62] != solution[78];
  constrain solution[62] != solution[79];
  constrain solution[62] != solution[80];
  constrain solution[69] != solution[70];
  constrain solution[69] != solution[71];
  constrain solution[69] != solution[78];
  constrain solution[69] != solution[79];
  constrain solution[69] != solution[80];
  constrain solution[70] != solution[71];
  constrain solution[70] != solution[78];
  constrain solution[70] != solution[79];
  constrain solution[70] != solution[80];
  constrain solution[71] != solution[78];
  constrain solution[71] != solution[79];
  constrain solution[71] != solution[80];
  constrain solution[78] != solution[79];
  constrain solution[78] != solution[80];
  constrain solution[79] != solution[80];
}

fn main(
  solution:  [u4; N2],
  puzzle: pub [u4; N2]
) {
  ensure_solution_for_puzzle(solution, puzzle);

  check_solution_lines(solution);
}
