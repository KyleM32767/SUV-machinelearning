# SUV-machinelearning

These days, the definition of "SUV" has been getting blurrier as these vehicles [become more and more popular,](https://www.autoblog.com/2019/07/02/june-auto-sales-trucks-suvs/) with some compact hatchbacks (such as the [Kia Soul](https://www.kia.com/us/en/vehicle/minivan-suv-crossover-cars)) being marketed as such, despite [Some people saying otherwise.](https://www.cars.com/articles/is-the-kia-soul-a-subcompact-suv-substitute-405219/) Thus I've decided to solve this issue with the power of machine learning, because when life gives you vague definitions, you make logistic regression.

[Here](https://docs.google.com/spreadsheets/d/18UOtyBForAf3aW_USDOHqGhmf4ej4Ei_MwEEtJGCSJc/edit?usp=sharing) is a more readable form of the dataset, which includes every car from Honda, Ford, and BMW currently being sold in the United States during the 2019 model year, with a separate entry for every for every possible drivetrain setup/bodystyle. For the purposes of this dataset, a car is an SUV if its Wikipedia page lists it as such.

As it turns out, the Kia Soul is not an SUV according to my model
