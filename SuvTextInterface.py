'''
    SuvTextInterface.py

    a simple text interface for the SUV algorithm, kind of as a quick way to test it or something

    author: Kyle Mitard

    created 5 July 2019
'''

import math

# get inputs

prompts = ["Doors? ", "Rear hatch? (1 = yes) ", "Seating rows? ", "Seating capacity? ", "Length? (in.) ", "Width? (in.) ", "Height? (in.) ", "Ground Clearance? (in.) ", "Drivetrain? (0 = RWD, 1 = FWD, 2 = AWD) "]

xIn = []
for s in prompts:
    xIn.append(float(input(s)))

# map the polynomial features

xMap = [1]
MAX_DEGREE = 2

for i in range (1, MAX_DEGREE + 1):
    for j in xIn:
        xMap.append(j ** i)

for h in range(2, MAX_DEGREE + 1):
    for i in range(0, len(xIn) - 1):
        for j in range(i + 1, len(xIn)):
            for k in range(1, h):
                xMap.append(xIn[i]**k * xIn[j]**(h-k))


# import the model

model = open("training/model.txt")
theta = list(map(float, model))
model.close()


# do the math

thetaTransposeX = 0
for i in range(0, len(theta)):
    thetaTransposeX += theta[i] * xMap[i]

y = 1 / (1 + math.exp(thetaTransposeX * -1))


# output result

print("That car has a " + str(100 * y) + "% chance of being an SUV.")
