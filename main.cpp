#include <iostream>
#include <SFML/Graphics.hpp>
#include <SFML/Window.hpp>
#include "src/Dog.h"

int main()
{
    Dog walter;

    sf::RenderWindow window(sf::VideoMode(320, 240), "SFML works!");
    window.setFramerateLimit(60);

    sf::Event event;

    while (window.isOpen())
    {
        while (window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
            {
                window.close();
            }
        }

        window.clear();
        window.display();
    }

    return 0;
}