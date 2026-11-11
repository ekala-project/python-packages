{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  jmespath,
  jsonschema,
  jxmlease,
  ncclient,
  netaddr,
  paramiko,
  ansible-pylibssh,
  pynetbox,
  scp,
  textfsm,
  xmltodict,
  passlib,

  # optionals
  withJunos ? false,
  withNetbox ? false,
}:

let
  pname = "ansible";
  version = "14.6.0";
in
buildPythonPackage {
  inherit pname version;
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-R80BP0tkYvFbZUhdCbcTrmRpcDZzMHjwYj9japT130U=";
  };

  # we make ansible-core depend on ansible, not the other way around,
  # since when you install ansible-core you will not have ansible
  # executables installed in the PATH variable
  pythonRemoveDeps = [ "ansible-core" ];

  build-system = [ setuptools ];

  dependencies = lib.unique (
    [
      # ansible.netcommon
      passlib
      jxmlease
      ncclient
      netaddr
      paramiko
      ansible-pylibssh
      xmltodict
      # ansible.utils
      jsonschema
      textfsm
      xmltodict
      # community.general
      jmespath
    ]
    ++ lib.optionals withJunos [
      jxmlease
      ncclient
      paramiko
      ansible-pylibssh
      scp
      xmltodict
    ]
    ++ lib.optionals withNetbox [
      pynetbox
    ]
  );

  # don't try and fail to strip 48000+ non strippable files, it takes >5 minutes!
  dontStrip = true;

  meta = {
    description = "Radically simple IT automation";
    mainProgram = "ansible-community";
    homepage = "https://www.ansible.com";
    license = lib.licenses.gpl3Plus;
  };
}
