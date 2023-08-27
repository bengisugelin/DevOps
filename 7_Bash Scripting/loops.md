## for loops

lets login to the scriptboxfirst.

```
$ vagrant up scriptbox
$ vagrant ssh scriptbox
[vagrant@scriptbox ~]$ sudo -i
[root@scriptbox ~]# cd /opt/scripts
```

now, lets create a bash file.

```
[root@scriptbox scripts]# vim 13_for.sh
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/a091512c-ef21-4100-825d-b80d19ff3a1f)

make it executable and run:
```
[root@scriptbox scripts]# chmod +x 13_for.sh
[root@scriptbox scripts]# ./13_for.sh
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/ff8e749d-c2fb-4304-bd24-3d12fa093d74)


let's do another one:

![image](https://github.com/bengisugelin/DevOps/assets/113550043/d8b277ce-64d6-40b4-a73f-80f5b3e54045)

![image](https://github.com/bengisugelin/DevOps/assets/113550043/e47427d0-3e97-4486-82cd-91c1b355fcb3)


## while loops

```
#!/bin/bash

counter=0

while [ $counter -lt 5]
do
  echo "Looping...."
  echo "Value of counter is $counter."
  counter=$(( $counter + 1 ))
  sleep 1
done

echo "Out of the loop"
```

![image](https://github.com/bengisugelin/DevOps/assets/113550043/95151dac-62fd-4149-bcdd-4d636f31ac95)

