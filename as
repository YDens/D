#include <iostream>

int main(int argc, char* argv[]) {
	int Day;
	int Day1;
	int Month;
	int Month1;
	int Year;
	int Year1;
	int a;
	int b;
	int c;
	int d;
	int e;
	int m;
	int y;
	
	char** date = new char*[3];
	for (int i = 0; i < 3; ++i) {
		date[i] = new char[4];
	}
	int q = 0;
	int w = 0;
	int z = 0;
	while (z!=10) {

		if (argv[1][z] == '.') {
			q += 1;
			w = 0;
		} else {
			date[q][w] = argv[1][z];
			w += 1;
		}
		z += 1;
	}

	if (48 <= date[0][0] && date[0][0] <= 57 && 48 <= date[0][1] && date[0][1] <= 57) {
		Day = (date[0][0] - '0') * 10 + date[0][1] - '0';
	}
	else if (48 <= date[0][0] && date[0][0] <= 57 && (48 > date[0][1] || date[0][1] > 57)) {
		Day = (date[0][0] - '0') ;
	} else {
		std::cout << "Unknown";
		return 0;
	}
	
	if (date[1][0] == '0') {
		if (49 <= date[1][1] && date[1][1] <= 57) {
			Month = date[1][1] - '0';
		} else {
			std::cout << "Unknown";
			return 0;
		}
	} else if (date[1][0] == '1') {
		if (48 <= date[1][1] && date[1][1] <= 50) {
			Month = (date[1][0] - '0') * 10 + date[1][1] - '0';
		}
		else if (48 > date[1][1] || date[1][1] > 57) {
			Month = (date[1][0] - '0');
		} else {
			std::cout << "Unknown";
			return 0;
		}
	} else if ( 49 <= date[1][0] && date[1][0] <= 57) {
		if (48 > date[1][1] || date[1][1] > 57) {
			Month = (date[1][0] - '0');
		} else {
			std::cout << "Unknown";
			return 0;
		}
	} else {
		std::cout << "Unknown";
		return 0;
	}
	

	Year = (date[2][0]-'0') * 1000 + (date[2][1] - '0') * 100 + (date[2][2] - '0') * 10 + (date[2][3] - '0');

	for (int f = 0; f < 3; ++f) {
		delete[] date[f];
	}
	delete[] date;
	
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
		return 0;
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
				return 0;
			}
		}
	} else {
		for (int i = Year + 1; i < Year + 20; ++i) {
			y = i - a;
			d = (Day + y + y / 4 - y / 100 + y / 400 + 31 * m / 12) % 7;
			if (d == 5) {
				std::cout << i;
				return 0;
			}
		}
	}

}
