{ buildPythonPackage
, dulwich
, lib
, fetchFromGitHub
, pbr
, pyyaml
, setuptools
,
}:

buildPythonPackage (finalAttrs: {
  pname = "reno";
  version = "4.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "openstack";
    repo = "reno";
    tag = finalAttrs.version;
    hash = "sha256-le9JtE0XODlYhTFsrjxFXG/Weshr+FyN4M4S3BMBLUE=";
  };

  env.PBR_VERSION = finalAttrs.version;

  build-system = [
    setuptools
  ];

  dependencies = [
    dulwich
    pbr
    pyyaml
    setuptools
  ];

  postInstallCheck = ''
    $out/bin/reno -h
  '';

  meta = {
    description = "Release Notes Manager";
    mainProgram = "reno";
    homepage = "https://docs.openstack.org/reno/latest";
    license = lib.licenses.asl20;
    teams = [ lib.teams.openstack ];
  };
})
