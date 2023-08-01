import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class PasswordUtil {

    // 임시 비밀번호 생성
    public String generateTempPassword() {
        String allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*";
        int length = 10; // 임시 비밀번호 길이 설정
        boolean useLetters = true;
        boolean useNumbers = true;
        boolean useSpecialCharacters = true;

        return generateRandomPassword(allowedChars, length);
    }

    // 비밀번호 유효성 체크
    public boolean isValidPassword(String password) {
        // 비밀번호는 8~16자 이내, 최소 소문자 1개, 최소 대문자 1개, 최소 숫자 1개, 최소 특수문자 1개 포함해야 함
        String pattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,16}$";
        return password.matches(pattern);
    }

    // 임시 비밀번호 생성 메서드
    private String generateRandomPassword(String allowedChars, int length) {
        Random random = new Random();
        StringBuilder password = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(allowedChars.length());
            password.append(allowedChars.charAt(randomIndex));
        }
        return password.toString();
    }
}