# Task1:  puppet file to install flask from pip3
# task also require specified version
package{ 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
