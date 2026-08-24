{ lib
, buildPythonPackage
, fetchFromGitHub
, poetry-core
, python-gvm
,
}:

buildPythonPackage (finalAttrs: {
  pname = "gvm-tools";
  version = "25.4.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "greenbone";
    repo = "gvm-tools";
    tag = "v${finalAttrs.version}";
    hash = "sha256-dt7njGUqi6zfwUz0gSdOHWnSUJ+yJ7qJ3RttoPweR3c=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [ python-gvm ];

  pythonImportsCheck = [ "gvmtools" ];

  meta = {
    description = "Collection of APIs that help with remote controlling a Greenbone Security Manager";
    homepage = "https://github.com/greenbone/gvm-tools";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
  };
})
