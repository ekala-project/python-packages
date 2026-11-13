{
  lib,
  buildPythonPackage,
  catkin-pkg,
  distro,
  fetchFromGitHub,
  pyyaml,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "rospkg";
  version = "1.6.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ros-infrastructure";
    repo = "rospkg";
    tag = finalAttrs.version;
    hash = "sha256-I6LiqL/eyM8HnSL4VZ5MfhOipV3Tu/ioCrQNziorksI=";
  };

  build-system = [ setuptools ];

  setupHook = ./setup-hook.sh;

  dependencies = [
    catkin-pkg
    distro
    setuptools
    pyyaml
  ];

  pythonImportsCheck = [ "rospkg" ];

  meta = {
    description = "ROS package library for Python";
    homepage = "http://wiki.ros.org/rospkg";
    license = lib.licenses.bsd3;
  };
})
