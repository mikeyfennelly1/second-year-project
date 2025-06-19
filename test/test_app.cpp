#include "../src/App.h"
#include <gtest/gtest.h>

TEST(AppTest, ConstructorAndGetters) {
    App obj("Bob", 25);
    EXPECT_EQ(obj.getName(), "Bob");
    EXPECT_EQ(obj.getAge(), 25);
}

TEST(AppTest, SetAgeWorks) {
    App obj("Bob", 25);
    obj.setAge(30);
    EXPECT_EQ(obj.getAge(), 30);
}
