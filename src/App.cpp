/**
 * @author Mikey Fennelly
 */

#include "App.h"

App::App(const std::string& name, int age) : name(name), age(age) {}

std::string App::getName() const {
    return name;
}

int App::getAge() const {
    return age;
}

void App::setAge(int newAge) {
    age = newAge;
}