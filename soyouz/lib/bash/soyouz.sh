base_path="$(dirname ${BASH_SOURCE[0]})"
echo "Base path: ${base_path}"
# loading order is important!
source ${base_path}/colors.sh
source ${base_path}/git.sh
source ${base_path}/profil.sh
