import pandas as pd
import numpy as np

EXTRA_ROWS = 500

# read title.episode, get the the first 80 rows
# we first read data from title.episode because the tconst in this table is very large
# and need to be consider first to save more time
title_episode_df = pd.read_csv('titleepisode.tsv', sep='\t', header=0, nrows=100)
# get all the primary key of title.episode
episode_title_set = set(title_episode_df['tconst'].tolist())

# read title.basic data
title_basic_df_whole = pd.read_csv('titlebasic.tsv', sep='\t', header=0, nrows=60000)
title_basic_df = pd.DataFrame(columns=title_basic_df_whole.columns.tolist())

# build the joint table for title basic and genres
title_genres_df = pd.DataFrame(columns=['titleGenreId', 'tconst', 'genreId'])
# build the genres table
genres_df = pd.DataFrame(columns=['genreId', 'genre'])
# create set for genre
genreMap = {}

count = 0
i = j = 1
for index, row in title_basic_df_whole.iterrows():
    # foreign integrity
    if row['tconst'] in episode_title_set:
        title_basic_df = title_basic_df.append(row)
    # more rows
    elif count < EXTRA_ROWS:
        title_basic_df = title_basic_df.append(row)
        count += 1

# add genres attributes
for index, row in title_basic_df.iterrows():
    genres_list = row['genres'].split(',') if row['genres'] else []
    for genre in genres_list:
        if genre != '\\N':
            if genre not in genreMap:
                genreMap[genre] = i
                genres_df = genres_df.append({'genreId': i, 'genre': genre}, ignore_index=True)
                i += 1
            title_genres_df = title_genres_df.append({'titleGenreId': j, 'tconst': row['tconst'], 'genreId': genreMap[genre]}, ignore_index=True)
            j += 1
title_basic_df = title_basic_df.drop(columns='genres')
basic_title_set = set(title_basic_df['tconst'].tolist())
title_basic_df.to_csv(r'subData/title_basic_table.tsv', index=None, sep='\t', mode='a')
genres_df.to_csv(r'subData/genres_table.tsv', index=None, sep='\t', mode='a')
title_genres_df.to_csv(r'subData/title_genres_table.tsv', index=None, sep='\t', mode='a')

# read title.rating
title_rating_df_whole = pd.read_csv('titlerating.tsv', sep='\t', header=0, nrows=50000)
title_rating_df = pd.DataFrame(columns=title_rating_df_whole.columns)

count = 0
for index, row in title_rating_df_whole.iterrows():
    if row['tconst'] in basic_title_set:
        title_rating_df = title_rating_df.append(row)
title_rating_df.to_csv(r'subData/title_rating_table.tsv', index=None, sep='\t', mode='a')

# do adjustment of title_episode table to satisified foreign integrity(FK in episode, PPK in basic).
# some FK in episode may not have corrosponding PK basic
title_episode_df_sub = pd.DataFrame(columns=title_episode_df.columns)
for index, row in title_episode_df.iterrows():
    if row['tconst'] in basic_title_set:
        title_episode_df_sub = title_episode_df_sub.append(row)
episode_title_set = set(title_episode_df_sub['tconst'].tolist())
title_episode_df_sub.to_csv(r'subData/title_episode_table.tsv', index=None, sep='\t', mode='a')

# read title.akas data
title_akas_df_whole = pd.read_csv('titleakas.tsv', sep='\t', header=0, nrows=50000, low_memory=False)
title_akas_df = pd.DataFrame(columns=title_akas_df_whole.columns)
count = 1

for index, row in title_akas_df_whole.iterrows():
    if row['titleId'] in basic_title_set and count < EXTRA_ROWS:
        title_akas_df = title_akas_df.append(row)
        count += 1
title_akas_df.to_csv(r'subData/title_akas_table.tsv', index=None, sep='\t', mode='a')

# read name_basic data
name_df_whole = pd.read_csv('namebasic.tsv', sep='\t', header=0, nrows=200000)
name_df = pd.DataFrame(columns=name_df_whole.columns.tolist()[:-1])
title_name_table = pd.DataFrame(columns=['titleNameId', 'tconst', 'nconst']) # join table

index_known = count = 1
for index, row in name_df_whole.iterrows():
    # get the titles
    known_for_titles_list = row['knownForTitles'].split(",") if row['knownForTitles'] else []
    for title in known_for_titles_list:
        if title in basic_title_set:
            # assign titleId in to KnownForTitles filed in order to match the foreign key.
            if row['nconst'] not in set(name_df['nconst'].tolist()):
                name_df = name_df.append(row[:-1])
            # add data to join table
            title_name_table = title_name_table.append({'titleNameId': index_known, 'tconst': title, 'nconst': row['nconst']}, ignore_index=True)
            index_known += 1
    if count < EXTRA_ROWS and row['nconst'] not in set(name_df['nconst'].tolist()):
        name_df = name_df.append(row[:-1])
        count += 1
title_name_table.to_csv(r'subData/title_name_table.tsv', index=None, sep='\t', mode='a')

# read title_principal data
title_principal_df_whole = pd.read_csv('titleprincipal.tsv', sep='\t', header=0, nrows=10000, low_memory=False)
title_principal_df = pd.DataFrame(columns=title_principal_df_whole.columns)

for index, row in title_principal_df_whole.iterrows():
    # foreign key in principal is the primary key of basic
    if row['tconst'] in basic_title_set:
        title_principal_df = title_principal_df.append(row)
principal_key_set = set(title_principal_df['nconst'].tolist())

# read title.crew
title_crew_df_whole = pd.read_csv('titlecrew.tsv', sep='\t', header=0, nrows=1000, low_memory=False)
title_crew_df = pd.DataFrame(columns=title_crew_df_whole.columns)

title_crew_table = title_crew_df_whole['tconst']
title_director_table = pd.DataFrame(columns=['directorId', 'tconst', 'nconst'])
title_writer_table = pd.DataFrame(columns=['writerId', 'tconst', 'nconst'])

i = j = 1
for index, row in title_crew_df_whole.iterrows():
    tconst, director_list, writer_list = row
    if director_list != '\\N':
        for director_id in director_list.split(','):
            if director_id < 'nm0010000':
                title_director_table = title_director_table.append({'directorId': i, 'tconst': tconst, 'nconst': director_id}, ignore_index=True)
                i += 1
    if writer_list != '\\N':
        for writer_id in writer_list.split(','):
            if writer_id < 'nm0010000':
                title_writer_table = title_writer_table.append({'writerId': j, 'tconst': tconst, 'nconst': writer_id}, ignore_index=True)
                j += 1
title_crew_table.to_csv(r'subData/title_crew_table.tsv', index=None, sep='\t', mode='a')
title_director_table.to_csv(r'subData/title_director_table.tsv', index=None, sep='\t', mode='a')
title_writer_table.to_csv(r'subData/title_writer_table.tsv', index=None, sep='\t', mode='a')

# add more rows to name.basics table and build director table and writer table
# read namebasic
name_df_sub = pd.read_csv('namebasic.tsv', sep='\t', header=0, nrows=200000)
director_table = pd.DataFrame(columns=name_df.columns[:-1])
writer_table = pd.DataFrame(columns=name_df.columns[:-1])

director_key_set = set(title_director_table['nconst'].tolist())
writer_key_set = set(title_writer_table['nconst'].tolist())

for index, row in name_df_sub.iterrows():
    count = 0
    if row['nconst'] in director_key_set:
        director_table = director_table.append(row[:-2])
        count += 1
    if row['nconst'] in writer_key_set:
        writer_table = writer_table.append(row[:-2])
        count += 1
    # add more rows in name table, need to consider writer, director and principal table
    if count != 0 and row['nconst'] not in set(name_df['nconst'].tolist()): # add rows based on writer/director
        name_df = name_df.append(row[:-1])
    if row['nconst'] not in set(name_df['nconst'].tolist()) and row['nconst'] in principal_key_set:
        name_df = name_df.append(row[:-1])

# add primaryProfession attributes
# build the joint table for title name_basic and primaryProfession Attribute
name_primaryprofession_table = pd.DataFrame(columns=['namePrimaryProfessionId', 'nconst', 'primaryProfessionId'])
# build the primaryProfession table
primaryprofession_table = pd.DataFrame(columns=['primaryProfessionId', 'primaryProfession'])
# create set for primaryProfession
primary_profession_map = {}
index_profession_join = index_profession = 1

for index, row in name_df.iterrows():
    primary_profession_list = row['primaryProfession'].split(',') if type(row['primaryProfession']) == str else []
    for primary_profession in primary_profession_list:
        if primary_profession != '\\N':
            if primary_profession not in primary_profession_map:
                primary_profession_map[primary_profession] = index_profession
                primaryprofession_table = primaryprofession_table.append({'primaryProfessionId': index_profession , 'primaryProfession': primary_profession}, ignore_index=True )
                index_profession += 1
            name_primaryprofession_table = name_primaryprofession_table.append({'namePrimaryProfessionId': index_profession_join, 'nconst':row['nconst'], 'primaryProfessionId': primary_profession_map[primary_profession]}, ignore_index=True )
            index_profession_join += 1
name_df = name_df.drop(columns=['primaryProfession'])
name_df['age'] = '\\N'
name_df['numMovies'] = '\\N'
name_df.to_csv(r'subData/name_basic_table.tsv', index=None, sep='\t', mode='a')
name_primaryprofession_table.to_csv(r'subData/name_primaryprofession_table.tsv', index=None, sep='\t', mode='a')
primaryprofession_table.to_csv(r'subData/primaryprofession_table.tsv', index=None, sep='\t', mode='a')

# update writer and director
for index, row in writer_table.iterrows():
    if row['nconst'] not in writer_key_set:
        writer_table.drop(index=index)
for index, row in director_table.iterrows():
    if row['nconst'] not in director_key_set:
        director_table.drop(index=index)
writer_table.to_csv(r'subData/writer_table.tsv', index=None, sep='\t', mode='a')
director_table.to_csv(r'subData/director_table.tsv', index=None, sep='\t', mode='a')

# update principal table
title_principal_table = pd.DataFrame(columns=title_principal_df.columns)
for index, row in title_principal_df.iterrows():
    if row['nconst'] in set(name_df['nconst'].tolist()):
        title_principal_table = title_principal_table.append(row)
title_principal_table.to_csv(r'subData/principal_table.tsv', index=None, sep='\t', mode='a')

