# Liens Utiles :
Dans l'ordre:

- Robotics 2 U1 (Kinematics) S6 (Parallel Manipulators) P2 (Inverse Kinematics)
https://www.youtube.com/watch?v=x7tkStus80U

- Robotics 2 U1 (Kinematics) S6 (Parallel Manipulators) P3 (Inverse Kinematics Example)
https://www.youtube.com/watch?v=NByxEHAuc_o

- Robotics 2 U1 (Kinematics) S6 (Parallel Manipulators) P4 (Python Simulation)
https://www.youtube.com/watch?v=XfVi_N6xHfs

# Configurations 

## Convetion de rotation
This project use the convention XYZ(Taite-Bryan angles) as the representation of rotation 

Where :

**Alpha** -> rotation around axis x  /Roll(Roulis)

**Beta** -> rotation around axis y /Pitch(Tangage)

**Yaw** -> rotation around axis z /Yaw(Lacet)


## Mesures
**R = 1e-02**  *the distance between the centroid of base star (origin of {0}) and the vertex of the equilateral triangle form by its three legs.*

**r = 1e-02**  *the distance between the centroid of the rigid star (origin of {1}) and the vertex of the equilateral triangle formed by its three legs.*

**zc0 = 1e-02** *the position of the origin of {1} with respect to {0} and since Frame {1} has the same orientation as {0} at initialization. (xc0 = yc0 = 0)*

**Links' Range**
l1, l2, l3 -> [1e-02, 1.5e-02]



