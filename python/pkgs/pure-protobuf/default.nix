{ lib
, buildPythonPackage
, fetchFromGitHub
, poetry-core
, poetry-dynamic-versioning
, typing-extensions
,
}:

buildPythonPackage rec {
  pname = "pure-protobuf";
  version = "3.1.5";

  pyproject = true;
  # < 3.10 requires get-annotations which isn't packaged yet

  src = fetchFromGitHub {
    owner = "eigenein";
    repo = "protobuf";
    tag = version;
    hash = "sha256-Gr5fKpagSUzH34IKHb+pBta4q71AqYa/KG9XW2AxZqk=";
  };

  build-system = [
    poetry-core
    poetry-dynamic-versioning
    typing-extensions
  ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "pure_protobuf" ];

  meta = {
    description = "Python implementation of Protocol Buffers with dataclass-based schemas";
    homepage = "https://github.com/eigenein/protobuf";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
