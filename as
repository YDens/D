#include <iostream>

int main(int argc, char* argv[]) {
	int Day, Day1;
	int Month, Month1;
	int Year, Year1;
	int a, b, c, d, e, m;
	int y;
	

	char** Argv = new char*[3];
	for (int i = 0; i < 3; ++i) {
		Argv[i] = new char[4];
	}
	int q = 0, w = 0;
	int z = 0;
	while(z != argc) {
		
		if (*argv[z] == '.') {
			q += 1;
			w = 0;

		} else {
			Argv[q][w] = *argv[z];
			w += 1;
		}
		z += 1;
	}

	if (48 <= Argv[0][0] && Argv[0][0] <= 57 && 48 <= Argv[0][1] && Argv[0][1] <= 57) {
		Day = (Argv[0][0] - '0') * 10 + Argv[0][1] - '0';
	}
	else if (48 <= Argv[0][0] && Argv[0][0] <= 57 && (48 > Argv[0][1] || Argv[0][1] > 57)) {
		Day = (Argv[0][0] - '0') ;
	} else {
		std::cout << "Unknown";
		return 2;
	}

	if (Argv[1][0] == '0') {
		if (49 <= Argv[1][1] && Argv[1][1] <= 57) {
			Month = Argv[1][1] - '0';
		} else {
			std::cout << "Unknown";
			return 2;
		}
	} else if (Argv[1][0] == '1') {
		if (48 <= Argv[1][1] && Argv[1][1] <= 50) {
			Month = (Argv[1][0] - '0') * 10 + Argv[1][1] - '0';
		} else {
			std::cout << "Unknown";
			return 2;
		}
	} else if ( 49 <= Argv[1][0] && Argv[1][0] <= 57) {
		if (48 > Argv[1][1] || Argv[1][1] > 57) {
			Month = (Argv[1][0] - '0');
		}
		else {
			std::cout << "Unknown";
			return 2;
		}
	} else {
		std::cout << "Unknown";
		return 2;
	}

	Year = (Argv[2][0]-'0') * 1000 + (Argv[2][1] - '0') * 100 + (Argv[2][2] - '0') * 10 + (Argv[2][3] - '0');

	a = (14 - Month) / 12;
	y = Year + 4800 - a;
	m = Month + 12 * a - 3;
	int JD = Day + (153 * m + 2) / 5 + 365 * y + y / 4 - y / 100 + y / 400 - 32045;
	
	a = JD + 32044;
	b = (4 * a + 3) / 146097;
	c = a - (146097 * b) / 4;
	d = (4 * c + 3) / 1461;
	e = c - (1461 * d / 4);
	m = (5 * e + 2) / 153;

	Day1 = e - (153 * m + 2) / 5 + 1;
	Month1 = m + 3 - 12 * (m / 10);
	Year1 = 100 * b + d - 4800 + m / 10;

	if (Day1 != Day || Month1 != Month || Year1 != Year) {
		std::cout << "Unknown";
		return 2;
	}

	a = (14 - Month) / 12;

	y = Year - a;

	m = Month + 12 * a - 2;

	d = (Day + y + y / 4 - y / 100 + y / 400 + 31 * m / 12) % 7;
	
	switch (d) {
		case 0:
			std::cout << "Sunday" << std::endl;
			break;
		case 1:
			std::cout << "Monday" << std::endl;
			break;
		case 2:
			std::cout << "Tuesday" << std::endl;
			break;
		case 3:
			std::cout << "Wednesday" << std::endl;
			break;
		case 4:
			std::cout << "Thursday" << std::endl;
			break;
		case 5:
			std::cout << "Friday" << std::endl;
			break;
		case 6:
			std::cout << "Saturday" << std::endl;
			break;
	}
	if (Day == 29 && Month == 2) {
		for (int i = Year + 4; i < Year + 20; i += 4) {
			y = i - a;
			d = (Day + y + y / 4 - y / 100 + y / 400 + 31 * m / 12) % 7;
			if (d == 5) {
				std::cout << i;
				return 1;
			}
		}
	} else {
		for (int i = Year + 1; i < Year + 20; ++i) {
			y = i - a;
			d = (Day + y + y / 4 - y / 100 + y / 400 + 31 * m / 12) % 7;
			if (d == 5) {
				std::cout << i;
				return 1;
			}
		}
	}

}
