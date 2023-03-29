is_prime_1_100 = [false, true, true, false, true, false, true, false, false, false, true, false, true, false, false, false, true, false, true, false, false, false, true, false, false, false, false, false, true, false, true, false, false, false, false, false, true, false, false, false, true, false, true, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, true, false, true, false, false, false, false, false, true, false, false, false, true, false, true, false, false, false, false, false, true, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false]

is_palindrome_1_100 = [true, true, true, true, true, true, true, true, true, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false]

for number in eachindex(is_prime_1_100)
    @test ProjectEuler.is_prime(number) == is_prime_1_100[number]
end

@test ProjectEuler.primality(100) == is_prime_1_100

for number in eachindex(is_prime_1_100)
    @test ProjectEuler.is_palindrome(number) == is_palindrome_1_100[number]
end