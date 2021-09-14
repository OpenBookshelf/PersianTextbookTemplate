#include <iostream>
using namespace std;

int main() {
    int integer;
    cout << "Enter an integer:\t";
    cin >> integer;

    int c1, c2, c3, c4, c5;
    c1 = integer%10;
    integer /= 10;
    c2 = integer%10;
    integer /= 10;
    c3 = integer%10;
    integer /= 10;
    c4 = integer%10;
    c5 = integer/10;

    cout << c5 << " " << c4 << " " << c3 << " " << c2 << " " << c1;

    return 0;
}