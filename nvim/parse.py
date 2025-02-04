import subprocess
import re

def parse_norminette_output(output):
    errors = []
    current_file = None

    for line in output.splitlines():
        # Vérifier si la ligne indique un fichier
        file_match = re.match(r"([\w\/]+\.(c|h)): Error!", line)
        if file_match:
            current_file = file_match.group(1)
            continue

        # Vérifier si la ligne contient une erreur
        error_match = re.match(r"Error: (.+?)\s+\(line:\s+(\d+), col:\s+(\d+)\):\s+(.+)", line)
        if error_match:
            error_type = error_match.group(1)
            line_num = error_match.group(2)
            col_num = error_match.group(3)
            error_desc = error_match.group(4)

            # Formatter l'erreur comme demandé
            formatted_error = f"{current_file}:{line_num}:{col_num}:{error_desc}"
            errors.append(formatted_error)

    return errors

def run_norminette():
    # Exécuter la commande norminette et capturer la sortie
    result = subprocess.run(['norminette'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

    # Récupérer la sortie de la commande
    norminette_output = result.stdout

    # Parser et formater les erreurs
    formatted_errors = parse_norminette_output(norminette_output)

    # Afficher les erreurs formatées
    for error in formatted_errors:
        print(error)

# Appeler la fonction qui exécute norminette
run_norminette()
