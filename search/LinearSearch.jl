struct WordCount
        Word::String
        Cword::Int64
end
function main()
        Shake = String[]
        Words = WordCount[]

        Shake = ReadWords(Shake)
        CheckArray(Words,Shake)

end
function CheckArray(a::Array{WordCount,1},b::Array{String,1})
        if (isempty(a))
                t = WordCount(b[1],LinearSort(b,b[1]))
                push!(a,t)
        end
        for j = 1:length(b)
                for i = 1:length(a)
                        if(b[j] != a[i].Word)
                                t = WordCount(b[j],LinearSort(b,b[j]))
                                push!(a,t)
                        end
                end
        end
end
function LinearSort(a::Array{string,1},s::String)
        count = 0
        for j = 1:length(a)
                if (a[j] == s)
                        count += 1
                end
        end
        return count
end
function ReadWords(a::Array{String,1})
        open("wordlist.txt") do f
                for i in enumerate(eachline(f))
                        if (i[2] != "")
                        c = Char
                        s = String
                        s = i[2]
                        c = s[1]
                                if (isletter(c) == true)
                                        s = lowercase(i[2])
                                        push!(a,s)
                                end
                        end
                end
        end
        return a
end
