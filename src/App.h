#ifndef MYCLASS_H
#define MYCLASS_H

#include <string>

class App {
private:
    std::string name;
    int age;

public:
    App(const std::string& name, int age);
    std::string getName() const;
    int getAge() const;
    void setAge(int newAge);
};

#endif
