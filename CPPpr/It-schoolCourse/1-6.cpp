#include <iostream>
#include <set>
#include <string>
using namespace std;
int main() {
    set<int> setOfCars;
    string command;
    int n,tmp;
    cin >> n;
    for(int i = 0; i<n;i++){
        cin >> tmp;
        setOfCars.insert(tmp);

    }
    while(true){
            cin >> command;
            if (command!="delivery"){
                cin >> tmp;
                if (command == "in"){
                    setOfCars.insert(tmp);
                }
                else{
                    auto pos=setOfCars.find(tmp);
                    if (pos!=setOfCars.end()){
                        setOfCars.erase(pos);
                    }
                    else{
                        cout << "ERROR";return 0;
                    }
                }
            }
            else{
                break;
            }
        }
    for(auto i:setOfCars){
        cout << i<<"\n";
    }
}