{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  certifi,
  click,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "gistyc";
  version = "1.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-WVK45U9e3qyZFi9wSRHNi9+1u4TetlZkYXAZN7LVqhE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    certifi
    click
    requests
  ];

  pythonImportsCheck = [ "gistyc" ];

  meta = {
    homepage = "https://github.com/ThomasAlbin/gistyc";
    description = "Python based GitHub GIST management tool";
    longDescription = ''
      gistyc is a Python-based library that enables developers to create, update
      and delete their GitHub GISTs. CLI capabilities allow you to execute the
      routines from the shell and can be integrated into your project's CI/CD
      pipeline to automatically create or update your GISTs (e.g., via GitHub
      actions). Files are separated in GIST sections depending on the separation
      blocks.
    '';
    license = lib.licenses.gpl3Plus;
  };
})
