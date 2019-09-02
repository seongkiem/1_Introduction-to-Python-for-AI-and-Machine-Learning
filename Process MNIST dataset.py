## Process MNIST dataset

from tensorflow import keras as ks

(train_images, train_labels), (test_images, test_labels) = ks.datasets.fashion_mnist.load_data()

x_train = train_images.reshape(train_images.shape[0], 28, 28, 1)
x_test = test_images.reshape(test_images.shape[0], 28, 28, 1)

x_train = x_train.astype('float32') / 255.
x_test = x_test.astype('float32') / 255.

y_train = ks.utils.to_categorical(train_labels, 10)
y_test = ks.utils.to_categorical(test_labels, 10)

print(x_train.shape)

input_shape = (28,28,1)

model = ks.Sequential()
model.add(ks.layers.Conv2D(32, kernel_size=(3, 3),
                 activation='relu',
                 input_shape=input_shape))
model.add(ks.layers.Conv2D(64, (3, 3), activation='relu'))
model.add(ks.layers.MaxPooling2D(pool_size=(2, 2)))
model.add(ks.layers.Dropout(0.25))

model.add(ks.layers.Flatten())
model.add(ks.layers.Dense(128, activation='relu'))
model.add(ks.layers.Dropout(0.5))                     
model.add(ks.layers.Dense(10, activation='softmax'))
model.summary()

model.compile(loss=ks.losses.categorical_crossentropy,
              optimizer='adam',
              metrics=['accuracy'])

model.fit(x_train, y_train,
          batch_size=128,
          epochs=3,
          verbose=1,
          validation_data=(x_test, y_test))

score = model.evaluate(x_test, y_test, verbose=0)