{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pkgs,
}:

buildPythonPackage (finalAttrs: {
  pname = "pylibacl";
  version = "0.7.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-nZ/7WA4MWC1d5ZgIf3X2lARYsjgQxhVSkUPGGxcr+SI=";
  };

  build-system = [ setuptools ];

  # ERROR: testExtended (tests.test_acls.AclExtensions)
  # IOError: [Errno 0] Error

  buildInputs = with pkgs; [ acl ];

  meta = {
    description = "Python extension module for POSIX ACLs, it can be used to query, list, add, and remove ACLs from files and directories under operating systems that support them";
    license = lib.licenses.lgpl21Plus;
  };
})
