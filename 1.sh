#!/bin/bash

grep -r --include=*.java -E "import ru.hh.deathstar" -L > almost_harmless.txt

