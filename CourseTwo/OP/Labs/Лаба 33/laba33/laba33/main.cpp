//
//  main.cpp
//  laba33
//
//  Created by Дмитрий Матвеенко on 20.04.18.
//  Copyright © 2018 GkFoxes. All rights reserved.
//

#include <fstream>
#include <iostream>
#include <vector>

using namespace std;

class checker {
    static int n;
public:
    bool operator()(char ch) {
        if (ch == '(') {
            n++;
        }
        else if (ch == ')' and !n--) {
            return false;
        }
        return true;
    }
    
    operator bool() {
        return !n;
    }
};

int checker::n = 0;

int main() {
    ifstream file("text2.txt");
    all_of(istream_iterator<char>(file), istream_iterator<char>(), checker());
    cout << (checker() ? "Скобки расставлены правильно" : "Скобки стоят неверно") << endl;
}

