class Notebook
	attr_accessor :notes_array                          #обеспечиваем доступ к массиву
	@@count_sn = 0										#счетчик объектов SharedNotebook

	def initialize										
		@notes_array = Array.new						#массив заметок
		if self.class == SharedNotebook					#если создаваемый объект - SharedNotebook, то увеличиваем счетчик на 1
			@@count_sn += 1
		end
	end

	def add_note(note)									#добавляем в массив объектов очередную заметку
		@notes_array.push(note)
	end

	def clean
		@notes_array.clear								#очищаем массив заметок
	end
end

class Note
	attr_accessor :text, :shared                        #доступ к тексту и признаку, расшарен ли объект
	
	def initialize(text)
		@text = text                                    #текст при инициализации
		@shared = false                                 #изначально заметка недоступна
	end

	def share(note)                                     
		@note_dup = note.dup                            #дубликат объекта типа Note
		@note_dup.shared = true                         #атрибут shared устанавливаем в true
		return @note_dup	                            #возвращаем дубликат объекта
	end
end

class SharedNotebook < Notebook
	def add_note(note)
		@notes_array.push(note.share(note))             #заносим в массив дубликат объекта Note с атрибутом share установленного в true
	end

	def count
		puts notes_array.size                           #метод подсчета объектов в массиве общего блокнота
	end

	def count_books
		puts @@count_sn                                 #метод подсчета количества общих блокнотов
	end
end

notebook1 = Notebook.new

note1 = Note.new("Some text for note 1")
note2 = Note.new("Some text for note 2")
note3 = Note.new("Some text for note 3")

notebook1.add_note(note1)
notebook1.add_note(note2)
notebook1.add_note(note3)

sharedbook1 = SharedNotebook.new

puts "-----------------Notebook class entries-----------------"

for sep_note in notebook1.notes_array
	puts sep_note.text
	puts sep_note.shared
end

for sep_note in notebook1.notes_array
	sharedbook1.add_note(sep_note)
end

puts "-----------------SharedNotebook class entries-----------------"

for sep_note in sharedbook1.notes_array
	puts sep_note.text
	puts sep_note.shared
end

puts "-----------------SharedNotebook class entries count-----------------"

sharedbook1.count

puts "-----------------SharedNotebook class objects count-----------------"

sharedbook1.count_books

puts "-----Notebook class entries. Verify SHARED attribute to be FALSE-----------"

for sep_note in notebook1.notes_array
	puts sep_note.text
	puts sep_note.shared
end



	










