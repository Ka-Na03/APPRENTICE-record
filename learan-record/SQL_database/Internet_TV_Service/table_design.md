

<details><summary><h2>STEP1. テーブル設計</h2></summary>

## CHANNELS

| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|------|-------------|------|-----|---------|----------------|
| id   | INT | - | PRI | - | YES |
| name | VARCHAR(50) | - | INDEX | - | - |
- **nameカラムにユニークキー制約を設定**

## TIME_SLOTS
 
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|------------|-------------|------|-----|---------|----------------|
| id         | INT | - | PRI | - | YES |
| start_time | DATETIME | - | - | - | - |
| end_time   | DATETIME | - | - | - | - |
 

## PROGRAMS
   
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|----------|-------------|------|-----|---------|----------------|
| id       | INT | - | PRI | - | YES |
| title    | VARCHAR(50) | - | - | - | - |
| details | TEXT | - | - | - | - |
| genre_id | INT | - | INDEX | - | - |
- **genre_idカラムは`GENRESテーブルのidカラム`を参照** 

## GENRES
 
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|-----|-------------|------|-----|---------|----------------|
| id  | INT | - | PRI | - | YES |
| name| VARCHAR(50) | - | INDEX | - | - |
- **nameカラムにユニークキー制約を設定**

## SERIES
 
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|-------|-------------|------|-----|---------|----------------|
| id    | INT | - | PRI | - | YES |
| title | VARCHAR(100) | - | - | - | - |
 

## SEASONS

| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|---------------|-------------|------|-----|---------|----------------|
| id            | INT | - | PRI | - | YES |
| program_id    | INT | - | INDEX | - | - |
| number | INT | YES | - | - | - |
- **program_idカラムは`PROGRAMSテーブルのidカラム`を参照**

## EPISODES
   
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|--------------|-------------|------|-----|---------|----------------|
| id           | INT | - | PRI | - | YES |
| season_id    | INT | - | INDEX | - | - |
| number       | INT | YES | - | - | - |
| title        | VARCHAR(100) | - | - | - | - |
| details      | TEXT | - | - | - | - |
| duration     | INT  | YES | - | - | - |
| release_date | DATE | YES | - | - | - |
- **season_idカラムは`SEASONSテーブルのidカラム`を参照** 

## VIEWERSHIP
   
| カラム名 | データ型 | Null | Key | 初期値 | AUTOINCREMENT |
|--------------|-------------|------|-----|---------|----------------|
| id           | INT | - | PRI | - | YES |
| episode_id   | INT | - | INDEX | - | - |
| time_slot_id | INT | - | INDEX | - | - |
| channel_id   | INT | - | INDEX | - | - |
| view_count   | INT | YES | - | 0 | - |
- **episode_idカラムは`EPOSODESテーブルのid`カラムを参照**
- **time_slot_idカラムは`TIME_SLOTSテーブルのid`カラムを参照**
- **channel_idカラムは`CHANNELSテーブルのid`カラムを参照**

</details>