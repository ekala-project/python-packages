{
  lib,
  buildPythonPackage,
  pythonAtLeast,
  python,
  fetchPypi,
  absl-py,
  etils,
}:

buildPythonPackage (finalAttrs: {
  pname = "array-record";
  version = "0.8.6";
  format = "wheel";

  disabled = pythonAtLeast "3.15";

  src =
    let
      pyShortVersion = "cp${builtins.replaceStrings [ "." ] [ "" ] python.pythonVersion}";
    in
    fetchPypi {
      inherit (finalAttrs) version;
      format = "wheel";
      pname = "array_record";
      dist = pyShortVersion;
      python = pyShortVersion;
      abi = pyShortVersion;
      platform = "manylinux2014_x86_64.manylinux_2_17_x86_64";
      hash =
        {
          cp311 = "sha256-sYiabBuxOdDMzbCtS9KxpE6JS061Yc7sDqj24v9slOw=";
          cp312 = "sha256-dv+6akd7UOKRHpwJR0KhffAG+5tlXGxkSur8hONdmVw=";
          cp313 = "sha256-XhRuYtkdXUsa0Uhv2zuvgesqWmGgDjKxqD7Y997oaA8=";
          cp314 = "sha256-8wdRI8LlTf13naLkbCYhCuYjiiPRIIHJQhjxE6bPIZ4=";
        }
        .${pyShortVersion} or (throw "${finalAttrs.pname} is missing hash for ${pyShortVersion}");
    };

  dependencies = [
    absl-py
    etils
  ]
  ++ etils.optional-dependencies.epath;

  pythonImportsCheck = [ "array_record" ];

  meta = {
    description = "New file format derived from Riegeli, achieving a new frontier of IO efficiency";
    homepage = "https://github.com/google/array_record";
    license = lib.licenses.asl20;
    platforms = [ "x86_64-linux" ];
  };
})
