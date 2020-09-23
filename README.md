# Quay Workshop Instructions
Getting started with Quay

This workshop will guide students through the various features of Quay version 3.x. It's applicable to anyone who wishes to get hands on managing container images with Quay.

Your instructor should assign you a user number. Several of the lab exercises in this workshop will require you to insert your user number to perform an operation. For example, the lab guide may ask you to enter your username and state `userX` as the example. If you are user number `1`, you would change this value to `user1` instead of `userX`.

## Student labs outline
[Lab 1 - Organizations and Repositories](https://github.com/mbach04/quay_workshop_instructions/blob/master/lab1.md)

[Lab 2 - Repo mirroring](https://github.com/mbach04/quay_workshop_instructions/blob/master/lab2.md)

[Lab 3 - Inspecting image layers and CVE's](https://github.com/mbach04/quay_workshop_instructions/blob/master/lab3.md)

[Lab 4 - Notifications](https://github.com/mbach04/quay_workshop_instructions/blob/master/lab4.md)

[Lab 5 - Working with images](https://github.com/mbach04/quay_workshop_instructions/blob/master/lab5.md)

___

## Instructor Notes
This workshop can be run on any OpenShift 4.x cluster with Quay 3.x deployed. It can also be done on a Quay instance deployed in HA on virtual machines, although the preferred architecture is Quay on OCP 4.x. You can deploy on top of a vanilla OCP 4.x cluster in RHPDS using the DevSecOps Workshop Deployer found here: [openshift-devsecops](https://github.com/jharmison-redhat/openshift-devsecops).

In order to complete all labs of this workshop, ensure your Quay instance has repo-mirroring enabled. If deploying using the [openshift-devsecops](https://github.com/jharmison-redhat/openshift-devsecops) repo, you'll need to set `enable_quay_repo_mirroring: yes` in the `devsecops.yml` variable file. Repo-mirroring requires a `rwx` storage provider as well.

Optionally, students will need a means to push / pull container images in order to complete the lab "Getting images into Quay". This can be done by hosting a RHEL8 instance and allowing students to SSH in. Or, if using the openshift-devsecops workshop deployer, you can use the butterfly project to give students a browser based SSH terminal, thus reducing student workstation requirements to Chrome or Firefox. 

## If you already have an existing Openshift 4 Cluster

If you are running an existing Openshift 4 cluster and would like to run the quay workshop there. Please navigate to the "Operators" tab under the Administrator's view. 

* Click on OperatorHub

* Search for "Red Hat Quay" & install

Once installed navigate back to your terminal screen and locate or create the `.dockercfg` file by doing one of the three following steps

* If you already have a `.dockercfg` file for the secured registry, you can `cp <path/to/.dockercfg> config.json`

* Or if you have a $HOME/.docker/config.json file, you can `cp <path/to/.docker/config.json> config.json`

* If you do not already have a Docker credentials file for the secured registry, you can create a secret by running the following
 
```
$ oc create secret docker-registry <pull_secret_name> \
    --docker-server=<registry_server> \
    --docker-username=<user_name> \
    --docker-password=<password> \
    --docker-email=<email>     
```

Finally run the `install-script`
